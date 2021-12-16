import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/friend_request_actor/friend_request_actor_cubit.dart';
import 'package:smart_dish/application/search_user/search_user_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';
import 'package:smart_dish/utils/date_time_extensions.dart';

import '../hybrid_scaffold.dart';
import 'widgets/buttons.dart';

class SearchUsersPage extends StatelessWidget {
  const SearchUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<SearchUserCubit>(),
      child: Builder(builder: (context) {
        return HybridScaffold(
          hideNavBarInMobile: true,
          appBar: AppBar(
            title: const Text("Search"),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: kIsWeb &&
                      defaultTargetPlatform != TargetPlatform.iOS &&
                      defaultTargetPlatform != TargetPlatform.android
                  ? orientationThreshold
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchBar(controller),
                  const Divider(),
                  const ResultList(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ResultList extends StatelessWidget {
  const ResultList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchUserCubit, SearchUserState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          isLoading: (_) => const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          ),
          loadingFailed: (state) => ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: const Icon(Icons.error),
              title: Text(state.failure.toMessage())),
          loadingSuccessful: (state) {
            if (state.users.isEmpty) {
              return const ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: Icon(Icons.error),
                  title: Text("Nothing found."));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  final isFriend = user.extendedData?.isFriend ?? false;
                  final isSignedInUser =
                      user.extendedData?.isSignedInUser ?? false;
                  final hasReceivedFriendRequest =
                      user.extendedData?.hasReceivedFriendRequest ?? false;
                  final hasSentFriendRequest =
                      user.extendedData?.hasSentFriendRequest ?? false;
                  final friendRequest = user.extendedData?.friendRequest;

                  return BlocProvider(
                    create: (context) => getIt<FriendRequestActorCubit>(),
                    child: BlocConsumer<FriendRequestActorCubit,
                        FriendRequestActorState>(
                      listener: (context, state) {
                        state.maybeMap(
                            orElse: () => null,
                            actionFailed: (state) => state.failure.showError(
                                context,
                                kIsWeb &&
                                    defaultTargetPlatform !=
                                        TargetPlatform.iOS &&
                                    defaultTargetPlatform !=
                                        TargetPlatform.android));
                      },
                      builder: (context, state) {
                        return ListTile(
                          onTap: () {},
                          leading: OvalImage(user.imageUrl),
                          title: Text(user.userName),
                          subtitle: state.map(
                            isLoading: (_) => const Text("is loading..."),
                            actionFailed: (state) =>
                                Text(state.failure.toMessage()),
                            friendDeleteSuccess: (_) =>
                                const Text("Friend deleted."),
                            isConfirming: (_) => const Text("is loading..."),
                            isRejecting: (_) => const Text("is loading..."),
                            requestConfirmSuccess: (_) =>
                                const Text("You are friends now."),
                            requestRejectedSuccess: (_) =>
                                const Text("Request rejected."),
                            requestSentSuccess: (_) => const Text(
                              "Request sent.",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            requestWithdrawSuccess: (_) =>
                                const Text("Request withdrawn."),
                            initial: (_) {
                              if (isSignedInUser) {
                                return const Text("That's you");
                              }
                              if (isFriend) {
                                return const Text("You are friends");
                              }
                              if (hasReceivedFriendRequest) {
                                return Text(
                                    "sent ${friendRequest!.createdAt!.toDisplayedString()}",
                                    style:
                                        const TextStyle(color: Colors.green));
                              }
                              if (hasSentFriendRequest) {
                                return Text(
                                  "received ${friendRequest!.createdAt!.toDisplayedString()}",
                                );
                              } else {
                                return const Text("sent a friend request");
                              }
                            },
                          ),
                          trailing: state.maybeMap(
                            actionFailed: (state) =>
                                const Icon(Icons.error, color: Colors.red),
                            friendDeleteSuccess: (_) => const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            requestConfirmSuccess: (_) => const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            requestRejectedSuccess: (_) => const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            requestSentSuccess: (_) => const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            requestWithdrawSuccess: (_) => const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            orElse: () {
                              if (hasReceivedFriendRequest) {
                                return WithdrawFriendRequestButton(
                                  friendRequest!,
                                  key: UniqueKey(),
                                );
                              }
                              if (hasSentFriendRequest) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AcceptFriendRequestButton(
                                      friendRequest!,
                                      key: UniqueKey(),
                                    ),
                                    const SizedBox(width: 4),
                                    RejectFriendRequestButton(
                                      friendRequest,
                                      key: UniqueKey(),
                                    ),
                                  ],
                                );
                              }
                              if (isFriend || isSignedInUser) {
                                return const SizedBox();
                              }

                              return CreateFriendRequestButton(user);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onSubmitted: (_) =>
            context.read<SearchUserCubit>().onSearchClicked(controller.text),
        decoration: InputDecoration(
          hintText: "type user name",
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context
                .read<SearchUserCubit>()
                .onSearchClicked(controller.text),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => controller.clear(),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
