import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/auth/auth_watcher_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/presentation/widgets/cancel_button.dart';
import 'package:smart_dish/presentation/auth/widgets/email_text_field.dart';
import 'package:smart_dish/presentation/widgets/info_text.dart';

import 'package:smart_dish/presentation/auth/widgets/password_text_field.dart';
import 'package:smart_dish/presentation/widgets/submit_button.dart';
import 'package:smart_dish/presentation/widgets/pretty_dialog.dart';

class UpdateEmailDialog extends StatelessWidget {
  const UpdateEmailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthEditorCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<AuthEditorCubit, EditorState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccess != current.failureOrSuccess,
          listener: (context, state) {
            state.failureOrSuccess?.fold(
              (l) => null,
              (unit) => context.read<AuthWatcherCubit>().signedOut(),
            );
          },
          child: PrettyDialog(
            title: "Change email",
            body: [
              PasswordTextField(
                hintText: "Password",
                textInputAction: TextInputAction.next,
                onChanged: context.read<AuthEditorCubit>().textField1Changed,
                shownAuthFailures: const [
                  WrongPassword(),
                  RequiresRecentLogin(),
                ],
              ),
              EmailTextField(
                textInputAction: TextInputAction.next,
                onChanged: context.read<AuthEditorCubit>().textField2Changed,
                hintText: "New email",
                onFieldSubmitted: (_) =>
                    context.read<AuthEditorCubit>().updateEmailPressed(),
                shownAuthFailures: const [
                  InvalidEmail(),
                  EmailAlreadyInUse(),
                ],
              ),
              const InfoText<AuthEditorCubit>(
                initial:
                    'After clicking on Submit you will automatically get logged out and receive an Email with a verification link. Please click on the link for confirming your new email address.',
                onSuccess: 'Verification Email sent. Please check your emails.',
              ),
            ],
            actions: [
              SubmitButton<AuthEditorCubit>(
                title: "Submit",
                onPressed: () =>
                    context.read<AuthEditorCubit>().updateEmailPressed(),
                hideOnSuccess: true,
              ),
              const CancelButton<AuthEditorCubit>(
                showOnlyOnSuccess: true,
                title: "Ok",
              ),
            ],
          ),
        );
      }),
    );
  }
}
