import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/core/crud_failure.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/friend_request/i_friend_request_repo.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';

@lazySingleton
class FriendRequestCubit extends WatcherCubit<List<FriendRequest>> {
  final IFriendRequestRepo _repo;

  FriendRequestCubit(this._repo) : super(_repo);

  Future<void> onRejectRequestClicked(String requestId) async {
    state.maybeMap(
      orElse: () {},
      loadingSuccessful: (state) async {
        if (setRequestToIsRejectingState(state, requestId)) {
          await _repo.rejectFriendRequest(requestId).then(
                (failureOrUnit) => failureOrUnit.fold(
                  (failure) {
                    if (failure != const CrudFailure.doesNotExist()) {
                      setRequestToFailureState(state, requestId, failure);
                    }
                  },
                  (success) {
                    setRequestToNotLoadingState(state, requestId);
                  },
                ),
              );
        }
      },
    );
  }

  Future<void> onConfirmRequestClicked(String requestId) async {
    state.maybeMap(
      orElse: () {},
      loadingSuccessful: (state) async {
        if (setRequestToIsConfirmingState(state, requestId)) {
          await _repo.confirmFriendRequest(requestId).then(
                (failureOrUnit) => failureOrUnit.fold(
                  (failure) {
                    if (failure != const CrudFailure.doesNotExist()) {
                      setRequestToFailureState(state, requestId, failure);
                    }
                  },
                  (success) {
                    setRequestToNotLoadingState(state, requestId);
                  },
                ),
              );
        }
      },
    );
  }

  void setRequestToFailureState(LoadingSuccessful<List<FriendRequest>> state,
      String requestId, CrudFailure failure) {
    final requestsWithFailure = state.data
        .map((r) => r.id == requestId
            ? r.copyWith(
                isBeingConfirmed: false,
                isBeingRejected: false,
                actionFailure: failure,
              )
            : r)
        .toList();
    emit(LoadingSuccessful<List<FriendRequest>>(requestsWithFailure));
  }

  void setRequestToNotLoadingState(
    LoadingSuccessful<List<FriendRequest>> state,
    String requestId,
  ) {
    final requestNotLoading = state.data
        .map((r) => r.id == requestId
            ? r.copyWith(
                isBeingConfirmed: false,
                isBeingRejected: false,
              )
            : r)
        .toList();
    emit(LoadingSuccessful<List<FriendRequest>>(requestNotLoading));
  }

  bool setRequestToIsRejectingState(
      LoadingSuccessful<List<FriendRequest>> state, String requestId) {
    bool setSuccessfully = false;

    final rejectInProgress = state.data.map(
      (r) {
        if (r.id == requestId && !r.isBeingConfirmed && !r.isBeingRejected) {
          setSuccessfully = true;
          return r.copyWith(
            isBeingRejected: true,
            actionFailure: null,
          );
        } else {
          return r;
        }
      },
    ).toList();

    emit(LoadingSuccessful<List<FriendRequest>>(rejectInProgress));
    return setSuccessfully;
  }

  bool setRequestToIsConfirmingState(
      LoadingSuccessful<List<FriendRequest>> state, String requestId) {
    bool setSuccessfully = false;

    final confirmInProgress = state.data.map(
      (r) {
        if (r.id == requestId && !r.isBeingRejected && !r.isBeingConfirmed) {
          setSuccessfully = true;

          return r.copyWith(
            isBeingConfirmed: true,
            actionFailure: null,
          );
        } else {
          return r;
        }
      },
    ).toList();

    emit(LoadingSuccessful<List<FriendRequest>>(confirmInProgress));
    return setSuccessfully;
  }
}
