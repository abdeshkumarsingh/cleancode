import 'dart:async';
import 'package:cleancode/config/routes/routes_names.dart';
import 'package:cleancode/services/session_manager/session_controller.dart';
import 'package:cleancode/views/home/home_screen.dart';
import 'package:cleancode/views/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices{

  void isLogin( BuildContext context){

    SessionController().getUserPreferences().then((value) {
      if (SessionController().isLoggedIn ?? false) {
        Timer(const Duration(seconds: 2), (){
          Navigator.pushNamedAndRemoveUntil(context, RoutesNames.homeScreen, (route) => false);
        });
      } else {
        Timer(const Duration(seconds: 2), (){
          Navigator.pushNamedAndRemoveUntil(context, RoutesNames.loginScreen, (route) => false,);
        });
      }
    },).onError((error, stackTrace) {
      Timer(const Duration(seconds: 5), () {
        Navigator.pushNamedAndRemoveUntil(context, RoutesNames.loginScreen, (route) => false,);
      });
    },);


  }
}