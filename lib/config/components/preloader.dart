import 'dart:io';

import 'package:cleancode/config/components/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Preloader extends StatelessWidget {

  final double height;
  final double width;

  const Preloader({super.key, this.height = 50, this.width = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Platform.isAndroid ? const CircularProgressIndicator(
          strokeWidth: 8,
          color: CustomColors.errorColor,
        ) : const CupertinoActivityIndicator(
          radius: 8,
          animating: true,
          color: CustomColors.errorColor,
        ),
    );
  }
}
