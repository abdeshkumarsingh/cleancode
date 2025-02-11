import 'package:cleancode/config/routes/routes_names.dart';
import 'package:cleancode/repository/auth/login_repository.dart';
import 'package:cleancode/utils/dependency/dependencies_container.dart';
import 'package:cleancode/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'config/routes/routes.dart';


void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      initialRoute: RoutesNames.splashScreen,
      onGenerateRoute: Routes.getRoutes,
    );
  }
}



