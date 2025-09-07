part of 'login_bloc.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial; // kelas Initial (publik)
  const factory LoginState.loading() = Loading; // kelas Loading
  const factory LoginState.success(String message) = Success; // kelas Success
  const factory LoginState.failure(String message) = Failure; // kelas Failure
}
