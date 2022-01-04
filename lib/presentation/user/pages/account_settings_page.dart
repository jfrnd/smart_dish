import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/account_editor/account_editor_cubit.dart';
import 'package:smart_dish/application/watcher/signed_in_user_watcher_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';
import 'package:smart_dish/presentation/auth/dialogs/update_email_dialog.dart';
import 'package:smart_dish/presentation/auth/dialogs/update_password_dialog.dart';
import 'package:smart_dish/presentation/auth/dialogs/delete_account_dialog.dart';
import 'package:smart_dish/presentation/core/loading_in_progress_overlay.dart';
import 'package:smart_dish/presentation/user/dialogs/update_user_name_dialog.dart';
import 'package:smart_dish/presentation/widgets/cropable_image.dart';
import 'package:smart_dish/utils/platform.dart';

import '../../hybrid_scaffold.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AccountEditorCubit>(),
        ),
      ],
      child: BlocBuilder<AccountEditorCubit, EditorState>(
        builder: (context, state) {
          return Stack(
            children: [
              HybridScaffold(
                appBar: AppBar(title: const Text("Account settings")),
                body: const AccountSettings(),
              ),
              LoadingInProgressOverlay(isLoading: state.isSubmitting)
            ],
          );
        },
      ),
    );
  }
}

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountEditorCubit, EditorState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccess != current.failureOrSuccess,
      listener: (context, state) {
        state.failureOrSuccess?.fold(
          (failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.toMessage()),
            ),
          ),
          (_) => null,
        );
      },
      child: BlocBuilder<SignedInUserWatcherCubit, WatcherState<User>>(
        builder: (context, state) => state.map(
            initial: (_) => const SizedBox(),
            isLoading: (_) => const Center(child: CircularProgressIndicator()),
            loadingFailed: (state) =>
                Center(child: Text(state.failure.toMessage())),
            loadingSuccessful: (state) {
              final user = state.data;
              return SingleChildScrollView(
                child: SizedBox(
                  width: deviceIsDesktop ? orientationThreshold : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CropableImage(
                        initialImageUrl: user.imageUrl,
                        onNewImageLoaded: (image) => context
                            .read<AccountEditorCubit>()
                            .updateUserPic(image),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () => showDialog(
                            context: context,
                            builder: (_) => const UpdateEmailDialog()),
                        leading: const Icon(Icons.email),
                        title: const Text("Email"),
                        subtitle: Text(user.email),
                        trailing: const Icon(Icons.edit),
                      ),
                      ListTile(
                        onTap: () => showDialog(
                            context: context,
                            builder: (_) => const UpdatePasswordDialog()),
                        leading: const Icon(Icons.lock),
                        title: const Text("Password"),
                        trailing: const Icon(Icons.edit),
                      ),
                      ListTile(
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => const UpdateUserNameDialog(),
                        ),
                        leading: const Icon(Icons.person),
                        title: const Text('Username'),
                        subtitle: Text(user.userName),
                        trailing: const Icon(Icons.edit),
                      ),
                      const Divider(
                        height: 20,
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () => showDialog(
                            context: context,
                            builder: (_) => const DeleteAccountDialog()),
                        icon: const Icon(Icons.delete),
                        label: const Text("Delete account"),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
