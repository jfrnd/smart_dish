import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/friend_request/friend_request.dart';
import 'package:smart_dish/domain/friend_request/i_friend_request_repo.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';

@lazySingleton
class FriendRequestWatcherCubit extends WatcherCubit<List<FriendRequest>> {
  FriendRequestWatcherCubit(IFriendRequestRepo repo) : super(repo);
}
