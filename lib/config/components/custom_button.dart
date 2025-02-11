import 'package:cleancode/config/components/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double width;
  final double height;
  final Color color;

  const CustomButton({super.key, required this.onTap, required this.title, this.width = 100, this.height = 40, this.color = CustomColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color
      ),
      width: width,
      height: height,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Center(
            child: Text(title , style: TextStyle(color: CustomColors.textColor, fontSize: 15, fontStyle: FontStyle.normal, ), ),
          ),
        ),
      )
    );
  }
}
