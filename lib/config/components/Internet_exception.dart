import 'package:cleancode/config/components/custom_colors.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onTap;

  const InternetExceptionWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      // color: CustomColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.signal_wifi_connected_no_internet_4_outlined, color: CustomColors.errorColor, size: 80,),
          const SizedBox(height: 20,),
          const Text('No Internet Connection', style: TextStyle(color: CustomColors.errorColor, fontSize: 20),),
          const SizedBox(height: 50,),
          CustomButton(onTap: onTap, title: 'Retry',),
        ],
      )
    );
  }
}
