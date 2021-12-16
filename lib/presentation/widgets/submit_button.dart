import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';

class SubmitButton<C extends EditorCubit> extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color textColor;
  final double height;
  final bool hideOnSuccess;
  final EdgeInsetsGeometry padding;
  final bool showLoadingIndicator;
  final Function() onPressed;

  const SubmitButton({
    Key? key,
    this.title = "Submit",
    this.backgroundColor,
    this.textColor = Colors.white,
    this.height = 55,
    required this.onPressed,
    this.hideOnSuccess = false,
    this.padding = const EdgeInsets.all(0),
    this.showLoadingIndicator = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, EditorState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.failureOrSuccess != current.failureOrSuccess,
      builder: (context, state) {
        return Padding(
          padding: padding,
          child: Visibility(
            visible:
                hideOnSuccess ? state.failureOrSuccess?.isLeft() ?? true : true,
            child: MaterialButton(
              color: backgroundColor ?? Theme.of(context).primaryColor,
              textColor: textColor,
              height: height,
              minWidth: double.infinity,
              onPressed: onPressed,
              child: state.isSubmitting && showLoadingIndicator
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(title),
            ),
          ),
        );
      },
    );
  }
}
