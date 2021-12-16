import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/presentation/widgets/cancel_button.dart';
import 'package:smart_dish/presentation/auth/widgets/email_text_field.dart';
import 'package:smart_dish/presentation/widgets/info_text.dart';

import 'package:smart_dish/presentation/widgets/submit_button.dart';
import 'package:smart_dish/presentation/widgets/pretty_dialog.dart';

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthEditorCubit>(),
      child: Builder(builder: (context) {
        return PrettyDialog(
          title: "Reset Password",
          body: [
            EmailTextField(
              textInputAction: TextInputAction.done,
              onChanged: context.read<AuthEditorCubit>().textField1Changed,
              onFieldSubmitted: (_) =>
                  context.read<AuthEditorCubit>().resetPasswordPressed(),
              shownAuthFailures: const [
                UserNotFound(),
                InvalidEmail(),
              ],
            ),
            const InfoText<AuthEditorCubit>(
              initial:
                  'After clicking on Reset you will receive an Email with reset instructions.',
              onSuccess:
                  'Email with reset instructions has been sent. Please check your emails.',
            ),
          ],
          actions: [
            SubmitButton<AuthEditorCubit>(
              title: "Reset",
              onPressed: () =>
                  context.read<AuthEditorCubit>().resetPasswordPressed(),
              hideOnSuccess: true,
            ),
            const CancelButton<AuthEditorCubit>(
              title: "Ok",
              showOnlyOnSuccess: true,
            ),
          ],
        );
      }),
    );
  }
}
