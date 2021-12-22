import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/presentation/auth/widgets/email_text_field.dart';
import 'package:smart_dish/presentation/widgets/info_text.dart';

import 'package:smart_dish/presentation/auth/widgets/password_text_field.dart';
import 'package:smart_dish/presentation/widgets/submit_button.dart';
import 'package:smart_dish/presentation/widgets/pretty_dialog.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';

class CreateAccountDialog extends StatelessWidget {
  const CreateAccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthEditorCubit>(),
      child: BlocListener<AuthEditorCubit, EditorState>(
        listener: (context, state) {
          state.failureOrSuccess?.fold(
            (failure) {},
            (success) {
              Navigator.of(context).pop();
              AutoRouter.of(context)
                  .push(EmailVerifyWaitingRoute(email: state.textField1));
            },
          );
        },
        child: Builder(builder: (context) {
          return PrettyDialog(
            title: 'Create new account',
            subtitle: 'It does not take much time.',
            body: [
              EmailTextField(
                textInputAction: TextInputAction.next,
                onChanged: context.read<AuthEditorCubit>().textField1Changed,
                shownAuthFailures: const [
                  OperationNotAllowed(),
                  EmailAlreadyInUse(),
                  InvalidEmail(),
                ],
              ),
              PasswordTextField(
                textInputAction: TextInputAction.next,
                onChanged: context.read<AuthEditorCubit>().textField2Changed,
                shownAuthFailures: const [
                  OperationNotAllowed(),
                  WeakPassword(),
                  PasswordsDoNotMatch(),
                ],
              ),
              PasswordTextField(
                textInputAction: TextInputAction.done,
                onChanged: context.read<AuthEditorCubit>().textField3Changed,
                hintText: "Confirm Password",
                shownAuthFailures: const [
                  OperationNotAllowed(),
                  WeakPassword(),
                  PasswordsDoNotMatch(),
                ],
                onFieldSubmitted: (_) =>
                    context.read<AuthEditorCubit>().signUpPressed(),
              ),
              const InfoText<AuthEditorCubit>(
                initial:
                    'After clicking on Create you will receive an Email with a verification link. Please click on the link for activating the account.',
                onSuccess:
                    'Account successfully created. Please check your emails.',
              ),
            ],
            actions: [
              SubmitButton<AuthEditorCubit>(
                title: "Create account",
                backgroundColor: Colors.green,
                onPressed: () =>
                    context.read<AuthEditorCubit>().signUpPressed(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
