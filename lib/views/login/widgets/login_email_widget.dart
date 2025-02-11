import 'package:cleancode/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class LoginEmailWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const LoginEmailWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
            onChanged: (value){
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              if (!Validator.emailValidator(value)) {
                return 'Invalid Email';
              }
              return null;
            },
          );
        }
    );
  }
}
