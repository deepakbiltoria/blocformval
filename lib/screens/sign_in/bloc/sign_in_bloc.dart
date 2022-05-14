import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState('please provide a valid email address'));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState('Password must be atleast of 7 digts'));
      } else {
        emit(SignInValidState());
      }
    });
    on<SubmitSignInDataEvent>((event, emit) {
      emit(SignInLoadingState(email: event.email, password: event.password));
    });
  }
}
