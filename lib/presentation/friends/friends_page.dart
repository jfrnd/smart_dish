import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:smart_dish/application/friend_request_actor/friend_request_actor_cubit.dart';

import 'package:smart_dish/application/watcher/friend_request_watcher_cubit.dart';
import 'package:smart_dish/application/watcher/friend_watcher_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/utils/date_time_extensions.dart';
import 'package:smart_dish/utils/logger.dart';

import '../hybrid_scaffold.dart';
import 'widgets/buttons.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HybridScaffold(
      appBar: AppBar(
        title: const Text("Friends"),
        automaticallyImplyLeading: kIsWeb ? false : true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: kIsWeb ? orientationThreshold : null,
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
                const ReceivedFriendRequests(),
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
                        child: FriendItem(user, key: UniqueKey()),
                      );
                    },
                  );
          },
        );
      },
    );
  }
}

class ReceivedFriendRequests extends StatelessWidget {
  const ReceivedFriendRequests({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendRequestWatcherCubit,
        WatcherState<List<FriendRequest>>>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          isLoading: (_) => const SizedBox(
              height: 200, child: Center(child: CircularProgressIndicator())),
          loadingFailed: (state) => Center(
            child: Center(child: Text(state.failure.toMessage())),
          ),
          loadingSuccessful: (state) {
            final requests = state.data
                // .where((request) => request.isReceivedBySignedInUser!)
                // .toList()
                ;

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
                        child: ReceivedRequestItem(request, key: UniqueKey()),
                      );
                    },
                    removeItemBuilder: (context, animation, request) {
                      return SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: animation,
                        child: ReceivedRequestItem(request, key: UniqueKey()),
                      );
                    },
                  );
          },
        );
      },
    );
  }
}

class FriendItem extends StatelessWidget {
  final User user;
  const FriendItem(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FriendRequestActorCubit>(),
      child: BlocBuilder<FriendRequestActorCubit, FriendRequestActorState>(
        builder: (context, state) {
          return ListTile(
            onTap: () {},
            leading: OvalImage(user.imageUrl),
            title: Text(user.userName),
            trailing: state.maybeMap(
              orElse: () => IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => DeleteFriendDialog(user),
                ),
              ),
              isLoading: (_) => const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

class ReceivedRequestItem extends StatelessWidget {
  const ReceivedRequestItem(
    this.request, {
    Key? key,
  }) : super(key: key);

  final FriendRequest request;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FriendRequestActorCubit>(),
      child: BlocBuilder<FriendRequestActorCubit, FriendRequestActorState>(
        builder: (context, state) {
          return ListTile(
            onTap: () {},
            leading: OvalImage(
              request.isReceivedBySignedInUser!
                  ? request.senderImageUrl
                  : request.receiverImageUrl,
            ),
            title: request.isReceivedBySignedInUser!
                ? Text(request.senderName, overflow: TextOverflow.ellipsis)
                : Text(request.receiverName, overflow: TextOverflow.ellipsis),
            subtitle: state.maybeMap(
              isConfirming: (_) => const Text("is confirming..."),
              isRejecting: (_) => const Text("is rejecting..."),
              isLoading: (_) => const Text("is withdrawing..."),
              requestConfirmSuccess: (_) => const Text(
                "Request confirmed.",
                style: TextStyle(color: Colors.green),
              ),
              requestRejectedSuccess: (_) => const Text(
                "Request rejected.",
                style: TextStyle(color: Colors.green),
              ),
              requestWithdrawSuccess: (_) {
                logger.d('123');
                return const Text(
                  "Request withdrawn.",
                  style: TextStyle(color: Colors.green),
                );
              },
              orElse: () => request.isReceivedBySignedInUser!
                  ? Text(
                      "received ${request.createdAt?.toDisplayedString()}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  : Text(
                      "sent ${request.createdAt?.toDisplayedString()}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
            ),
            trailing: state.maybeMap(
              requestConfirmSuccess: (_) =>
                  const Icon(Icons.check_circle, color: Colors.green),
              requestRejectedSuccess: (_) =>
                  const Icon(Icons.check_circle, color: Colors.green),
              requestWithdrawSuccess: (_) =>
                  const Icon(Icons.check_circle, color: Colors.green),
              orElse: () {
                if (request.isReceivedBySignedInUser!) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AcceptFriendRequestButton(request, key: UniqueKey()),
                      const SizedBox(width: 4),
                      RejectFriendRequestButton(request, key: UniqueKey()),
                    ],
                  );
                } else {
                  return WithdrawFriendRequestButton(request);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class DeleteFriendDialog extends StatelessWidget {
  final User friend;
  const DeleteFriendDialog(
    this.friend, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FriendRequestActorCubit>(),
      child: AlertDialog(
        title: const Text('Delete Friend'),
        content: const Text('Are you sure you want to delete this friend?'),
        actions: [
          MaterialButton(
            color: Colors.grey,
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          BlocBuilder<FriendRequestActorCubit, FriendRequestActorState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => MaterialButton(
                  child: const Text('Delete'),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                    context
                        .read<FriendRequestActorCubit>()
                        .onDeleteFriend(friend);
                  },
                ),
                isLoading: (_) => const CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}
