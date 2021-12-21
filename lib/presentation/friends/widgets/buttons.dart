import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/search_user/search_user_cubit.dart';
import 'package:smart_dish/application/watcher/friend_request_cubit.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/user/user_extended_data.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';

class AcceptFriendRequestButton extends StatelessWidget {
  final FriendRequest request;
  const AcceptFriendRequestButton(
    this.request, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendRequestCubit, WatcherState<List<FriendRequest>>>(
      builder: (context, state) => SizedBox(
        width: 60,
        child: MaterialButton(
          color: Colors.green,
          onPressed: () => context
              .read<FriendRequestCubit>()
              .onConfirmRequestClicked(request.id!),
          child: request.isBeingConfirmed
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : const Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }
}

class RejectFriendRequestButton extends StatelessWidget {
  final FriendRequest request;
  const RejectFriendRequestButton(
    this.request, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendRequestCubit, WatcherState<List<FriendRequest>>>(
      builder: (context, state) => SizedBox(
        width: 60,
        child: MaterialButton(
          color: Colors.red,
          onPressed: () => context
              .read<FriendRequestCubit>()
              .onRejectRequestClicked(request.id!),
          child: request.isBeingRejected
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : const Icon(Icons.clear, color: Colors.white),
        ),
      ),
    );
  }
}

class WithdrawFriendRequestButton extends StatelessWidget {
  final FriendRequest request;
  const WithdrawFriendRequestButton(
    this.request, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendRequestCubit, WatcherState<List<FriendRequest>>>(
      builder: (context, state) => MaterialButton(
        color: Colors.grey,
        onPressed: () => context
            .read<FriendRequestCubit>()
            .onRejectRequestClicked(request.id!),
        child: request.isBeingRejected
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : const Icon(Icons.undo, color: Colors.white),
      ),
    );
  }
}

class CreateFriendRequestButton extends StatelessWidget {
  final User user;
  const CreateFriendRequestButton(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user.sendingRequestFailureOrSuccess?.fold(
          (failure) => const Icon(Icons.error, color: Colors.red),
          (success) => const Icon(Icons.check_circle, color: Colors.green),
        ) ??
        MaterialButton(
          color: Colors.green,
          onPressed: () =>
              context.read<SearchUserCubit>().onSendFriendRequestClicked(user),
          child: Builder(
            builder: (context) {
              if (user.isSendingFriendRequest) {
                return const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else {
                return const Icon(Icons.person_add, color: Colors.white);
              }
            },
          ),
        );
  }
}
