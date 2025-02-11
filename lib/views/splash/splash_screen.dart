import 'package:cleancode/config/components/Internet_exception.dart';
import 'package:cleancode/config/components/custom_button.dart';
import 'package:cleancode/data/exception/exception.dart';
import 'package:cleancode/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

import '../../config/components/preloader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashServices _splashServices = SplashServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
