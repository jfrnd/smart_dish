import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';

class CancelButton<C extends EditorCubit> extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color textColor;
  final double height;
  final bool showOnlyOnSuccess;

  const CancelButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.height = 55,
    this.showOnlyOnSuccess = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, EditorState>(
      buildWhen: (previous, current) =>
          previous.failureOrSuccess != current.failureOrSuccess,
      builder: (context, state) {
        return Visibility(
          visible: showOnlyOnSuccess
              ? state.failureOrSuccess?.isRight() ?? false
              : true,
          child: MaterialButton(
            color: backgroundColor ?? Colors.grey[100],
            textColor: textColor,
            height: height,
            minWidth: double.infinity,
            onPressed: () => Navigator.of(context).pop(),
            child: Text(title),
          ),
        );
      },
    );
  }
}
