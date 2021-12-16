
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_dish/utils/logger.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

const dev = Environment('dev');
const prod = Environment('prod');

@injectableInit
Future<void> configureInjection(String env) async {
  logger.i(env);
  await $initGetIt(getIt, environment: env);
}
