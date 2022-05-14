part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  String emailValue;
  String passwordValue;
  SignInTextChangedEvent(
      {required this.emailValue, required this.passwordValue});
}

// ignore: must_be_immutable
class SubmitSignInDataEvent extends SignInEvent {
  String email;
  String password;
  SubmitSignInDataEvent({required this.email, required this.password});
}
