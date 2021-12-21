import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/search_user/search_user_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/user/user_extended_data.dart';
import 'package:smart_dish/presentation/friends/widgets/buttons.dart';
import 'package:smart_dish/presentation/friends/widgets/request_item.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';

import '../hybrid_scaffold.dart';
import 'friends_page.dart';

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

                  if (user.isFriend || user.isSignedInUser) {
                    return ListTile(
                        leading: OvalImage(user.imageUrl),
                        title: Text(user.userName),
                        subtitle: user.isFriend
                            ? const Text("You are friends.")
                            : const Text("This is you."));
                  } else if (user.hasOpenFriendRequest &&
                      !user.isSignedInUser) {
                    return RequestItem(user.friendRequest!.id!);
                  } else {
                    return ListTile(
                      leading: OvalImage(user.imageUrl),
                      title: Text(user.userName),
                      subtitle: Builder(
                        builder: (context) {
                          if (user.isSendingFriendRequest) {
                            return const Text("is sending...");
                          } else {
                            return user.sendingRequestFailureOrSuccess?.fold(
                                  (failure) => Text(failure.toMessage()),
                                  (unit) =>
                                      const Text("Request sent successfully."),
                                ) ??
                                const Text("Send request.");
                          }
                        },
                      ),
                      trailing: CreateFriendRequestButton(user),
                    );
                  }
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
