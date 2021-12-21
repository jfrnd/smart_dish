import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/friend_actor/friend_actor_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/user/user.dart';

class DeleteFriendDialog extends StatelessWidget {
  final User friend;
  const DeleteFriendDialog(
    this.friend, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FriendActorCubit>(),
      child: BlocConsumer<FriendActorCubit, FriendActorState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            actionSuccess: (_) => Navigator.of(context).pop(),
          );
        },
        builder: (context, state) => AlertDialog(
          title: const Text('Delete Friend'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you sure you want to delete this friend?'),
              state.maybeMap(
                orElse: () => const SizedBox(),
                actionFailure: (state) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.failure.toMessage(),
                            style: const TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              color: Colors.grey,
              textColor: Colors.white,
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            MaterialButton(
              textColor: Colors.white,
              child: state.maybeMap(
                orElse: () => const Text('Delete'),
                isLoading: (_) => const SizedBox(
                    height: 20,
                    width: 20,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )),
              ),
              color: Colors.red,
              onPressed: () {
                context.read<FriendActorCubit>().onDeleteFriendClicked(friend);
              },
            ),
          ],
        ),
      ),
    );
  }
}
