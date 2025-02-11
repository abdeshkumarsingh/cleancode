import 'dart:convert';

import 'package:cleancode/model/user_model/user_model.dart';
import 'package:cleancode/services/storage/local_storage.dart';
import 'package:flutter/material.dart';


class SessionController {

  static final SessionController _instance = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel? user = UserModel();
  bool? isLoggedIn;

  SessionController._internal(){
    isLoggedIn = false;
  }

  factory SessionController() {
    return _instance;
  }
  
  
  Future<void> saveUserPreferences(dynamic user) async {
    localStorage.createData('token', jsonEncode(user));
    localStorage.createData('isLoggedIn', 'true');
  }

  Future<void> getUserPreferences() async {
    try {
      var userData = await localStorage.getData('token');
      var isLoggedInData = await localStorage.getData('isLoggedIn');
      if (userData != null) {
        final user = UserModel.fromJson(jsonDecode(userData));
        SessionController().user = user;
      }
      SessionController().isLoggedIn = isLoggedInData == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearUserPreferences() async {
    await localStorage.deleteData('token');
    await localStorage.deleteData('isLoggedIn');
    SessionController().user = null;
    SessionController().isLoggedIn = false;
  }
}