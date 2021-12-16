import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dish/domain/editor/editor_cubit.dart';

class InfoText<C extends EditorCubit> extends StatelessWidget {
  final String? initial;
  final String? onSuccess;
  final String? onFailure;
  final EdgeInsets padding;

  const InfoText({
    Key? key,
    this.initial,
    this.onSuccess,
    this.onFailure,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, EditorState>(
      builder: (context, state) {
        return Padding(
          padding: padding,
          child: state.failureOrSuccess?.fold(
                (authFailure) => Visibility(
                  visible: onFailure != null,
                  child: SelectableText(
                    onFailure ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.red),
                  ),
                ),
                (success) => Visibility(
                  visible: onSuccess != null,
                  child: SelectableText(
                    onSuccess ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.green),
                  ),
                ),
              ) ??
              Visibility(
                visible: initial != null,
                child: SelectableText(
                  initial ?? "",
                  style: Theme.of(context).textTheme.caption!,
                ),
              ),
        );
      },
    );
  }
}
