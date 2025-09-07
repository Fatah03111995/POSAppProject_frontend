import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<_Login>((event, emit) async {
      emit(LoginState.loading());
      await Future.delayed(Duration(seconds: 2)); // Simulate network delay
      emit(LoginState.success("Login successful for ${event.email}"));
    });
  }
}
