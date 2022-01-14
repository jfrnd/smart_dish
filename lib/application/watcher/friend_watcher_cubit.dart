import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/user/i_friends_repo.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';

@lazySingleton
class FriendWatcherCubit extends WatcherCubit<List<User>> {
  FriendWatcherCubit(IUserFriendsRepo repo) : super(repo);

  List<User> readFriends() => state.maybeMap(
        loadingSuccessful: (state) => state.data,
        orElse: () => <User>[],
      );
}
