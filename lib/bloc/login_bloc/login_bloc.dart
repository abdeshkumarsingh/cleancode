import 'package:bloc/bloc.dart';
import 'package:cleancode/main.dart';
import 'package:cleancode/model/user_model/user_model.dart';
import 'package:cleancode/repository/auth/login_repository.dart';
import 'package:cleancode/services/session_manager/session_controller.dart';
import 'package:cleancode/utils/enums/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginButtonClicked>((event, emit) async {
      Map data = {
        "email": state.email,
        "password": state.password
      };

        final response = await loginRepository.login(data).then((value) async {
            if (value!.error.toString() != '') {
              print('failure state');
              emit(state.copyWith(postApiStatus: PostApiStatus.failure, errorMessage: state.errorMessage!));
            } else {
              await SessionController().saveUserPreferences(value);
              await SessionController().getUserPreferences();
              print('success state');
              emit(state.copyWith(postApiStatus: PostApiStatus.success, errorMessage: '',));
            }
        },).onError((error, stackTrace) {
          print('error state');
            emit(state.copyWith(postApiStatus: PostApiStatus.failure, errorMessage: error.toString(),));
        },);
    });
  }
}
