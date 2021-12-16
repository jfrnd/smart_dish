import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/friend_request_actor/friend_request_actor_cubit.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/user/user.dart';

class AcceptFriendRequestButton extends StatelessWidget {
  final FriendRequest request;
  const AcceptFriendRequestButton(
    this.request, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendRequestActorCubit, FriendRequestActorState>(
      builder: (context, state) => SizedBox(
        width: 60,
        child: MaterialButton(
          color: Colors.green,
          onPressed: () => context
              .read<FriendRequestActorCubit>()
              .onConfirmRequestClicked(request.id!),
          child: state.maybeMap(
            orElse: () => const Icon(Icons.check, color: Colors.white),
            isConfirming: (_) => const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
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
    return BlocBuilder<FriendRequestActorCubit, FriendRequestActorState>(
      builder: (context, state) => SizedBox(
        width: 60,
        child: MaterialButton(
          color: Colors.red,
          onPressed: () => context
              .read<FriendRequestActorCubit>()
              .onRejectRequestClicked(request.id!),
          child: state.maybeMap(
            orElse: () => const Icon(Icons.clear, color: Colors.white),
            isRejecting: (state) => const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
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
    return BlocBuilder<FriendRequestActorCubit, FriendRequestActorState>(
      builder: (context, state) => MaterialButton(
        color: Colors.grey,
        onPressed: () => context
            .read<FriendRequestActorCubit>()
            .onWithdrawRequestClicked(request.id!),
        child: state.maybeMap(
          orElse: () => const Icon(Icons.undo, color: Colors.white),
          isLoading: (state) => const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
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
    return BlocBuilder<FriendRequestActorCubit, FriendRequestActorState>(
      builder: (context, state) => MaterialButton(
        color: Colors.green,
        onPressed: () => context
            .read<FriendRequestActorCubit>()
            .onSendFriendRequestClicked(user),
        child: state.maybeMap(
          orElse: () => const Icon(Icons.person_add, color: Colors.white),
          isLoading: (state) => const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
