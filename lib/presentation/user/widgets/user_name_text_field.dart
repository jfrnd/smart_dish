import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/application/account_editor/account_editor_cubit.dart';
import 'package:smart_dish/domain/core/failure.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';

class UserNameTextField extends StatelessWidget {
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function(String) onChanged;
  final String hintText;

  const UserNameTextField({
    Key? key,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.hintText = "User name",
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountEditorCubit, EditorState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextFormField(
            enabled:
                state.failureOrSuccess?.fold((l) => true, (r) => false) ?? true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              hintText: hintText,
              suffixIcon: state.failureOrSuccess?.isRight() == true
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : null,
            ),
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            autocorrect: false,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: (value) => onChanged(value),
            validator: (value) => value == null || value.isEmpty
                ? "Cannot be empty"
                : context.read<AccountEditorCubit>().state.failureOrSuccess?.fold(
                      (crudFailure) => crudFailure.toMessage(),
                      (success) => null,
                    ),
          ),
        );
      },
    );
  }
}
