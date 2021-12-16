import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/auth/auth_watcher_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/main.dart';
import 'package:smart_dish/presentation/auth/dialogs/create_account_dialog.dart';
import 'package:smart_dish/presentation/auth/dialogs/forgot_password_dialog.dart';
import 'package:smart_dish/presentation/auth/widgets/email_text_field.dart';
import 'package:smart_dish/presentation/auth/widgets/password_text_field.dart';
import 'package:smart_dish/presentation/widgets/submit_button.dart';
import 'package:smart_dish/presentation/widgets/brand_box.dart';
import 'package:smart_dish/presentation/core/loading_in_progress_overlay.dart';
import 'package:smart_dish/presentation/router/router.gr.dart';
import 'package:smart_dish/utils/context_extensions.dart';
import 'package:smart_dish/web_test_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthEditorCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: kIsWeb ? null : AppBar(title: const Text("Sign In")),
        backgroundColor: Colors.grey[200],
        body: BlocListener<AuthWatcherCubit, AuthWatcherState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              authenticated: (_) {
                context.triggerWatcherCubits();
                AutoRouter.of(context).popUntilRoot();
                AutoRouter.of(context).replace(const HomeRoute());
              },
            );
          },
          child: BlocBuilder<AuthEditorCubit, EditorState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: const [
                          BrandBox(),
                          SignInBox(),
                        ],
                      ),
                    ),
                  ),
                  LoadingInProgressOverlay(isLoading: state.isSubmitting),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SignInBox extends StatelessWidget {
  const SignInBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: kIsWeb ? 350 : MediaQuery.of(context).size.width),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EmailTextField(
                textInputAction: TextInputAction.next,
                onChanged: context.read<AuthEditorCubit>().textField1Changed,
                shownAuthFailures: const [
                  ServerError(),
                  InvalidEmailAndPasswordCombination(),
                  InvalidEmail(),
                  EmailNotVerified(),
                  UserDisabled(),
                ],
              ),
              PasswordTextField(
                onChanged: context.read<AuthEditorCubit>().textField2Changed,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) =>
                    context.read<AuthEditorCubit>().signInPressed(),
                shownAuthFailures: const [
                  ServerError(),
                  InvalidEmailAndPasswordCombination(),
                  UserDisabled(),
                ],
              ),
              SubmitButton<AuthEditorCubit>(
                onPressed: () =>
                    context.read<AuthEditorCubit>().signInPressed(),
                title: 'Log In',
                showLoadingIndicator: false,
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              const ForgotPasswordButton(),
              const Divider(),
              const CreateNewAccountButton(),
              const Visibility(
                  visible: environment == Environment.dev, child: Divider()),
              Visibility(
                visible: environment == Environment.dev,
                child: SubmitButton<AuthEditorCubit>(
                  backgroundColor: Colors.red,
                  showLoadingIndicator: false,
                  title: "Test Sign In Jan",
                  onPressed: () =>
                      context.read<AuthEditorCubit>().testSignIn("jan@test.de"),
                ),
              ),
              const Visibility(
                  visible: environment == Environment.dev, child: Divider()),
              Visibility(
                visible: environment == Environment.dev,
                child: SubmitButton<AuthEditorCubit>(
                  backgroundColor: Colors.red,
                  showLoadingIndicator: false,
                  title: "Test Sign In Dan",
                  onPressed: () =>
                      context.read<AuthEditorCubit>().testSignIn("dan@test.de"),
                ),
              ),
              const Visibility(
                  visible: environment == Environment.dev, child: Divider()),
              Visibility(
                visible: environment == Environment.dev,
                child: SubmitButton<AuthEditorCubit>(
                  backgroundColor: Colors.red,
                  showLoadingIndicator: false,
                  title: "Test Sign In Barney",
                  onPressed: () => context
                      .read<AuthEditorCubit>()
                      .testSignIn("barney@test.de"),
                ),
              ),
              const Visibility(
                  visible: environment == Environment.dev, child: Divider()),
              Visibility(
                visible: environment == Environment.dev,
                child: SubmitButton<AuthEditorCubit>(
                  backgroundColor: Colors.red,
                  showLoadingIndicator: false,
                  title: "Test Sign In Ted",
                  onPressed: () =>
                      context.read<AuthEditorCubit>().testSignIn("ted@test.de"),
                ),
              ),
              const Visibility(
                  visible: environment == Environment.dev, child: Divider()),
              Visibility(
                visible: environment == Environment.dev,
                child: SubmitButton<AuthEditorCubit>(
                  backgroundColor: Colors.red,
                  showLoadingIndicator: false,
                  title: "Test Sign In Marshall",
                  onPressed: () => context
                      .read<AuthEditorCubit>()
                      .testSignIn("marshall@test.de"),
                ),
              ),
              const Visibility(
                  visible: environment == Environment.dev, child: Divider()),
              Visibility(
                visible: environment == Environment.dev,
                child: SubmitButton<AuthEditorCubit>(
                  backgroundColor: Colors.red,
                  showLoadingIndicator: false,
                  title: "Test Sign In Lilly",
                  onPressed: () => context
                      .read<AuthEditorCubit>()
                      .testSignIn("lilly@test.de"),
                ),
              ),
              const Visibility(
                  visible: environment == Environment.dev, child: Divider()),
              Visibility(
                visible: environment == Environment.dev,
                child: SubmitButton<AuthEditorCubit>(
                  backgroundColor: Colors.red,
                  showLoadingIndicator: false,
                  title: "Test Sign In Robin",
                  onPressed: () => context
                      .read<AuthEditorCubit>()
                      .testSignIn("robin@test.de"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
          context: context, builder: (_) => const ForgotPasswordDialog()),
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class CreateNewAccountButton extends StatelessWidget {
  const CreateNewAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: MaterialButton(
        color: Colors.green,
        height: 40,
        textColor: Colors.white,
        minWidth: double.infinity,
        onPressed: () {
          showDialog(
              context: context, builder: (_) => const CreateAccountDialog());
        },
        child: const Text('Create new account'),
      ),
    );
  }
}
