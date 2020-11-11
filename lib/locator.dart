import 'package:get_it/get_it.dart';
import 'package:wash_app/core/services/authService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerSingleton<AuthService>(AuthService());
}
