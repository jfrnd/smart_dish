import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/presentation/widgets/cancel_button.dart';
import 'package:smart_dish/presentation/auth/widgets/password_text_field.dart';
import 'package:smart_dish/presentation/widgets/submit_button.dart';
import 'package:smart_dish/presentation/widgets/pretty_dialog.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthEditorCubit>(),
      child: BlocListener<AuthEditorCubit, EditorState>(
        listener: (context, state) {
          state.failureOrSuccess?.fold(
            (failure) => null,
            (success) => AutoRouter.of(context).replace(
              const SignInRoute(),
            ),
          );
        },
        child: Builder(
          builder: (context) {
            return PrettyDialog(
              title: 'Delete Account',
              body: [
                const DeleteInfoText(),
                PasswordTextField(
                  onChanged: context.read<AuthEditorCubit>().textField1Changed,
                  textInputAction: TextInputAction.done,
                  shownAuthFailures: const [
                    WrongPassword(""),
                    RequiresRecentLogin(""),
                  ],
                  onFieldSubmitted: (_) =>
                      context.read<AuthEditorCubit>().deletePressed(),
                ),
              ],
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: CancelButton<AuthEditorCubit>(
                          title: 'Cancel',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: SubmitButton<AuthEditorCubit>(
                            title: "Delete",
                            backgroundColor: Colors.red,
                            onPressed: () => context
                                .read<AuthEditorCubit>()
                                .deletePressed()),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DeleteInfoText extends StatelessWidget {
  const DeleteInfoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SelectableText(
        'Are you sure you want to delete your account? All your data will be erased permanently. This action cannot be undone.',
        style:
            Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.red),
      ),
    );
  }
}
