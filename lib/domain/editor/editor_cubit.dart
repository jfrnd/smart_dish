import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dish/domain/core/failure.dart';

part 'editor_state.dart';
part 'editor_cubit.freezed.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(EditorState.initial());

  void textField1Changed(String value) => emit(state.copyWith(
        failureOrSuccess: null,
        textField1: value,
      ));
  void textField2Changed(String value) => emit(state.copyWith(
        failureOrSuccess: null,
        textField2: value,
      ));
  void textField3Changed(String value) => emit(state.copyWith(
        failureOrSuccess: null,
        textField3: value,
      ));
  void textField4Changed(String value) => emit(state.copyWith(
        failureOrSuccess: null,
        textField4: value,
      ));
  void textField5Changed(String value) => emit(state.copyWith(
        failureOrSuccess: null,
        textField5: value,
      ));
}
