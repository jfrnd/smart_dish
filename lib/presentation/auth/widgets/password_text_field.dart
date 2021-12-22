import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/domain/core/failure.dart';

class PasswordTextField extends StatelessWidget {
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function(String) onChanged;
  final List<AuthFailure> shownAuthFailures;
  final String hintText;

  const PasswordTextField({
    Key? key,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.hintText = "Password",
    required this.shownAuthFailures,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthEditorCubit, EditorState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextFormField(
            enabled:
                state.failureOrSuccess?.fold((l) => true, (r) => false) ?? true,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: const Icon(Icons.lock),
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
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => onChanged(value),
            validator: (value) => value == null || value.isEmpty
                ? "Cannot be empty"
                : context.read<AuthEditorCubit>().state.failureOrSuccess?.fold(
                      (authFailure) => authFailure is Unknown ||
                              authFailure is TooManyRequests ||
                              shownAuthFailures.any((failure) {
                                return authFailure.runtimeType ==
                                    failure.runtimeType;
                              })
                          ? authFailure.toMessage()
                          : null,
                      (success) => null,
                    ),
          ),
        );
      },
    );
  }
}
