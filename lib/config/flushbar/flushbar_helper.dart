import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:cleancode/config/components/custom_colors.dart';
import 'package:cleancode/views/login/widgets/widgets.dart';

class FlushBarHelper {

  static void errorMessageBar(BuildContext context, String message){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          borderRadius: BorderRadius.circular(10),
          backgroundColor: CustomColors.errorColor,
          flushbarPosition: FlushbarPosition.TOP,
          message: message,
          icon: const Icon(Icons.error_outline, color: CustomColors.textColor,),
          duration: const Duration(seconds: 3),
    )..show(context));
  }
  static void successMessageBar(BuildContext context, String message){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          borderRadius: BorderRadius.circular(10),
          backgroundColor: CustomColors.successColor,
          flushbarPosition: FlushbarPosition.TOP,
          message: message,
          icon: const Icon(Icons.error_outline, color: CustomColors.textColor,),
          duration: const Duration(seconds: 3),
        )..show(context));
  }
}