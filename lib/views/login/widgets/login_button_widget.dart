import 'package:cleancode/bloc/login_bloc/login_bloc.dart';
import 'package:cleancode/config/flushbar/flushbar_helper.dart';
import 'package:cleancode/config/routes/routes_names.dart';
import 'package:cleancode/utils/enums/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/components/custom_button.dart';
import 'widgets.dart';

class LoginButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String title;
  const LoginButtonWidget({super.key, required this.formKey, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
      if (state.postApiStatus == PostApiStatus.success) {
        Navigator.pushReplacementNamed(context, RoutesNames.homeScreen);
      }
      if (state.postApiStatus == PostApiStatus.failure) {
        FlushBarHelper.errorMessageBar(context, 'failure');
      }

    },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return CustomButton(onTap: (){
            if (formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(LoginButtonClicked());
            }
          }, title: title,);
        },
      ),
    );
  }
}

