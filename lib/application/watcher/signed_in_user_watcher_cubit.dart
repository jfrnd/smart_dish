import 'package:injectable/injectable.dart';
import 'package:smart_dish/domain/user/i_account_repo.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/domain/watcher/watcher_cubit.dart';

@lazySingleton
class SignedInUserWatcherCubit extends WatcherCubit<User> {
  SignedInUserWatcherCubit(IAccountRepo repo) : super(repo);
}
