import 'package:cleancode/config/routes/routes_names.dart';
import 'package:cleancode/views/views.dart';
import 'package:flutter/material.dart';


class Routes{

  static Route<dynamic> getRoutes(RouteSettings route) {
    switch(route.name){
      case RoutesNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),);
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFound());
    }
  }
}