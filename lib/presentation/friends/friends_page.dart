import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

import 'package:smart_dish/application/watcher/friend_request_cubit.dart';
import 'package:smart_dish/application/watcher/friend_watcher_cubit.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';
import 'package:smart_dish/presentation/friends/widgets/friend_item.dart';
import 'package:smart_dish/presentation/friends/widgets/request_item.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/utils/platform.dart';

import '../hybrid_scaffold.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HybridScaffold(
      appBar: AppBar(title: const Text("Friends")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: deviceIsDesktop ? orientationThreshold : null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  tileColor: Colors.grey[100],
                  leading: const Icon(Icons.person_add),
                  title: const Text("Find other users"),
                  onTap: () =>
                      AutoRouter.of(context).push(const SearchUsersRoute()),
                ),
                const Divider(height: 0),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Requests",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const Divider(height: 0),
                const FriendRequestList(),
                const Divider(height: 0),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Friends",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const Divider(height: 0),
                const FriendsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FriendsList extends StatelessWidget {
  const FriendsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendWatcherCubit, WatcherState<List<User>>>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          isLoading: (_) => const Center(child: CircularProgressIndicator()),
          loadingFailed: (state) =>
              Center(child: Text(state.failure.toMessage())),
          loadingSuccessful: (state) {
            final users = state.data;
            return users.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'no friends added yet...',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  )
                : ImplicitlyAnimatedList<User>(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    items: users,
                    areItemsTheSame: (a, b) => a.id == b.id,
                    itemBuilder: (context, animation, user, index) {
                      return SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: animation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: FriendItem(user, key: UniqueKey()),
                        ),
                      );
                    },
                  );
          },
        );
      },
    );
  }
}

class FriendRequestList extends StatelessWidget {
  const FriendRequestList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendRequestCubit, WatcherState<List<FriendRequest>>>(
      buildWhen: (p, c) {
        if (c is LoadingSuccessful<List<FriendRequest>> &&
            p is LoadingSuccessful<List<FriendRequest>>) {
          return p.data.length != c.data.length;
        } else {
          return p.runtimeType != c.runtimeType;
        }
      },
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          isLoading: (_) => const SizedBox(
              height: 200, child: Center(child: CircularProgressIndicator())),
          loadingFailed: (state) => Center(
            child: Center(child: Text(state.failure.toMessage())),
          ),
          loadingSuccessful: (state) {
            final requests = state.data;
            return requests.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'there are no friend requests...',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  )
                : ImplicitlyAnimatedList<FriendRequest>(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    items: requests,
                    areItemsTheSame: (a, b) => a.id == b.id,
                    itemBuilder: (context, animation, request, index) {
                      return SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: animation,
                        child: RequestItem(request, key: UniqueKey()),
                      );
                    },
                  );
          },
        );
      },
    );
  }
}

extension RequestListX on List<FriendRequest> {
  FriendRequest? findRequestOrNull(String requestId) {
    return firstWhereOrNull((r) => r.id == requestId);
  }
}
