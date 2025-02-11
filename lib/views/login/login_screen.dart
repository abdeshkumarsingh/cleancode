import 'package:cleancode/bloc/login_bloc/login_bloc.dart';
import 'package:cleancode/main.dart';
import 'package:cleancode/repository/auth/login_repository.dart';
import 'package:cleancode/utils/dependency/dependencies_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;

  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt<LoginRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (context) => _loginBloc,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     LoginEmailWidget(emailFocusNode: _emailFocusNode),
                     const SizedBox(height: 20),
                     LoginPasswordWidget(passwordFocusNode: _passwordFocusNode),
                     const SizedBox(height: 20),
                     LoginButtonWidget(formKey: _formKey, title: 'Login')
                  ],
                )
              ),
            )
          )
        )
    );
  }
}