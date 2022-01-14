import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'navigation_state.dart';
part 'navigation_cubit.freezed.dart';

@lazySingleton
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.initial());

  void homeSelected() => emit(const NavigationState.homeSelected());
  void friendsSelected() => emit(const NavigationState.friendsSelected());
  void householdsSelected() => emit(const NavigationState.householdsSelected());
  void accountSettingsSelected() =>
      emit(const NavigationState.accountSettingsSelected());
}
