import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/account_editor/account_editor_cubit.dart';
import 'package:smart_dish/di/injection.dart';
import 'package:smart_dish/presentation/user/widgets/user_name_text_field.dart';
import 'package:smart_dish/presentation/widgets/cancel_button.dart';
import 'package:smart_dish/presentation/widgets/info_text.dart';
import 'package:smart_dish/presentation/widgets/submit_button.dart';
import 'package:smart_dish/presentation/widgets/pretty_dialog.dart';

class UpdateUserNameDialog extends StatelessWidget {
  const UpdateUserNameDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccountEditorCubit>(),
      child: Builder(
        builder: (context) {
          return PrettyDialog(
            title: "Change user name",
            body: [
              UserNameTextField(
                hintText: "User name",
                textInputAction: TextInputAction.done,
                onChanged: context.read<AccountEditorCubit>().textField1Changed,
                onFieldSubmitted: (_) =>
                    context.read<AccountEditorCubit>().updateUserNamePressed(),
              ),
              const InfoText<AccountEditorCubit>(
                onSuccess: "User name changed.",
              )
            ],
            actions: [
              SubmitButton<AccountEditorCubit>(
                title: "Submit",
                onPressed: () =>
                    context.read<AccountEditorCubit>().updateUserNamePressed(),
                hideOnSuccess: true,
              ),
              const CancelButton<AccountEditorCubit>(
                showOnlyOnSuccess: true,
                title: "Ok",
              ),
            ],
          );
        },
      ),
    );
  }
}
