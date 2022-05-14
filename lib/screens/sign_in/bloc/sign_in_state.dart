part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  String errorMessage;
  SignInErrorState(this.errorMessage);
}

class SignInLoadingState extends SignInState {
  String email;
  String password;
  SignInLoadingState({required this.email, required this.password});
}
