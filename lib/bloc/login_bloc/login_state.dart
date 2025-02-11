part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String? errorMessage;

  const LoginState({this.errorMessage = '', this.email = '', this.password = '', this.postApiStatus = PostApiStatus.initial});

  LoginState copyWith({String? email, String? password, String? errorMessage, PostApiStatus? postApiStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, errorMessage, postApiStatus];
}

