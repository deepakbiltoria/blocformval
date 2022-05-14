import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          SizedBox(
            height: 40,
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInErrorState) {
                return Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return Text(
                  'All is Well',
                  style: TextStyle(color: Colors.green),
                );
              }
            },
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: emailController,
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(
                SignInTextChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text),
              );
            },
            decoration: InputDecoration(hintText: 'Email Address'),
          ),
          SizedBox(
            height: 45.0,
          ),
          TextField(
            controller: passwordController,
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(
                SignInTextChangedEvent(
                    emailValue: emailController.text,
                    passwordValue: passwordController.text),
              );
            },
            decoration: InputDecoration(hintText: 'Password'),
          ),
          SizedBox(
            height: 45.0,
          ),
          BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SignInLoadingState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Row(
                    children: [
                      Text(
                        state.email,
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        state.password,
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  )),
                );
              }
            },
            builder: (context, state) {
              if (state is SignInLoadingState) {
                return Center(child: CircularProgressIndicator());
              }

              return ElevatedButton(
                onPressed: () {
                  if (state is SignInValidState) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SubmitSignInDataEvent(
                          email: emailController.text,
                          password: passwordController.text),
                    );
                  }
                },
                child: Center(
                  child: Text(
                    'Submit',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
