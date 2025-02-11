part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PasswordChanged extends LoginEvent {
final String password;

 const PasswordChanged({required this.password});

 @override
  // TODO: implement props
  List<Object> get props => [password];
}

class EmailChanged extends LoginEvent {
final String email;

 const EmailChanged({required this.email});

 @override
  // TODO: implement props
  List<Object> get props => [email];
}

class LoginButtonClicked extends LoginEvent {}