import 'package:cleancode/config/components/preloader.dart';
import 'package:flutter/material.dart';
import '../../config/routes/routes_names.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Preloader(),
            const Text('Oops! Page not found'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(RoutesNames.homeScreen);
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
