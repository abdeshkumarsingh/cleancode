import 'package:cleancode/repository/auth/login_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(),);
  
}