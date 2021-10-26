import 'package:get_it/get_it.dart';

import 'package_info_repository.dart';
import 'remote_config_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> setupService() async {
  getIt.registerLazySingleton(() => RemoteConfigRepository());
  getIt.registerLazySingleton(() => PackageInfoRepository());
}
