import 'package:another_flushbar/flushbar_route.dart';
import 'package:cleancode/config/flushbar/flushbar_helper.dart';
import 'package:cleancode/config/routes/routes_names.dart';
import 'package:cleancode/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              SessionController().clearUserPreferences().then((value) {
                Navigator.pushReplacementNamed(context, RoutesNames.loginScreen);
                FlushBarHelper.successMessageBar(context, 'Logout Successfully');
              },);
            },
            icon: const Icon(Icons.logout),
          )
        ],
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
