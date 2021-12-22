import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/presentation/widgets/cancel_button.dart';
import 'package:smart_dish/presentation/widgets/info_text.dart';

import 'package:smart_dish/presentation/auth/widgets/password_text_field.dart';
import 'package:smart_dish/presentation/widgets/submit_button.dart';
import 'package:smart_dish/presentation/widgets/pretty_dialog.dart';

class UpdatePasswordDialog extends StatelessWidget {
  const UpdatePasswordDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthEditorCubit>(),
      child: Builder(builder: (context) {
        return PrettyDialog(
          title: "Update password",
          body: [
            PasswordTextField(
              hintText: "Old password",
              textInputAction: TextInputAction.next,
              onChanged: context.read<AuthEditorCubit>().textField1Changed,
              shownAuthFailures: const [
                WrongPassword(""),
                RequiresRecentLogin(""),
              ],
            ),
            PasswordTextField(
              hintText: "New password",
              textInputAction: TextInputAction.next,
              onChanged: context.read<AuthEditorCubit>().textField2Changed,
              shownAuthFailures: const [
                RequiresRecentLogin(""),
                PasswordsDoNotMatch(),
                WeakPassword(""),
              ],
            ),
            PasswordTextField(
              hintText: "Confirm new password",
              textInputAction: TextInputAction.done,
              onChanged: context.read<AuthEditorCubit>().textField3Changed,
              shownAuthFailures: const [
                RequiresRecentLogin(""),
                PasswordsDoNotMatch(),
                WeakPassword(""),
              ],
              onFieldSubmitted: (_) =>
                  context.read<AuthEditorCubit>().changePasswordPressed(),
            ),
            const InfoText<AuthEditorCubit>(
              onSuccess: 'Password changed.',
            ),
          ],
          actions: [
            SubmitButton<AuthEditorCubit>(
              title: "Submit",
              onPressed: () =>
                  context.read<AuthEditorCubit>().changePasswordPressed(),
              hideOnSuccess: true,
            ),
            const CancelButton<AuthEditorCubit>(
              showOnlyOnSuccess: true,
              title: "Ok",
            ),
          ],
        );
      }),
    );
  }
}
