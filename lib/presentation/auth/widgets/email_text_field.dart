import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';
import 'package:smart_dish/auth/auth_editor_cubit.dart';
import 'package:smart_dish/auth/auth_failure.dart';
import 'package:smart_dish/domain/core/failure.dart';

class EmailTextField extends StatelessWidget {
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function(String) onChanged;
  final List<AuthFailure> shownAuthFailures;
  final String hintText;

  const EmailTextField({
    Key? key,
    required this.textInputAction,
    this.onFieldSubmitted,
    required this.shownAuthFailures,
    this.hintText = "Email",
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
              prefixIcon: const Icon(Icons.email),
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
                : context.read<AuthEditorCubit>().state.failureOrSuccess?.fold(
                      (authFailure) => (const [
                                    ServerError(),
                                    TooManyRequests()
                                  ] +
                                  shownAuthFailures)
                              .contains(authFailure)
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
