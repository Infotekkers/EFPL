import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/snack_bar.dart';
import '../../../../application/auth/register_form/register_form_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                failure.maybeMap(
                  // connection errors
                  networkError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Network Error",
                      message: "Please check your connection",
                      snackBarType: "warning",
                    );
                  },
                  serverError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Server Error",
                      message: "Please check your connection",
                      snackBarType: "warning",
                    );
                  },
                  // Value failures
                  cancelledByUser: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Cancellation!",
                      message: "Process Cancelled by USer",
                      snackBarType: "warning",
                    );
                  },
                  emailAlreadyInUse: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Credential Issue",
                      message: "Email Alrady In Use",
                      snackBarType: "warning",
                    );
                  },
                  emptyError: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: 'Empty Field',
                      message: "Please fill in required fields",
                      snackBarType: "error",
                    );
                  },

                  orElse: () {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Something went wrong.",
                      message: "Something went wrong. Try again!",
                      snackBarType: "error",
                    );
                  },
                );
              },
              (_) {
                Navigator.popAndPushNamed(context, "/home");
              },
            );
          },
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            children: [
              const Text(
                '👤',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 120),
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) => BlocProvider.of<RegisterFormBloc>(context)
                    .add(RegisterFormEvent.emailChanged(value)),
                validator: (_) => context
                    .read<RegisterFormBloc>()
                    .state
                    .email
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'User Name',
                ),
                autocorrect: false,
                onChanged: (value) => BlocProvider.of<RegisterFormBloc>(context)
                    .add(RegisterFormEvent.userNameChanged(value)),
                validator: (_) => context
                    .read<RegisterFormBloc>()
                    .state
                    .userName
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            invalidName: (_) => 'Invalid Username',
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.sports_soccer),
                  labelText: 'Team Name',
                ),
                autocorrect: false,
                onChanged: (value) => BlocProvider.of<RegisterFormBloc>(context)
                    .add(RegisterFormEvent.teamNameChanged(value)),
                validator: (_) => context
                    .read<RegisterFormBloc>()
                    .state
                    .teamName
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            invalidName: (_) => 'Invalid Team Name',
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                onChanged: (value) => BlocProvider.of<RegisterFormBloc>(context)
                    .add(RegisterFormEvent.passwordChanged(value)),
                validator: (_) => context
                    .read<RegisterFormBloc>()
                    .state
                    .password
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            shortPassword: (_) =>
                                'Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number',
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              TextFormField(
                // keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Confirm Password',
                ),
                autocorrect: false,
                onChanged: (value) => BlocProvider.of<RegisterFormBloc>(context)
                    .add(RegisterFormEvent.confirmPasswordChanged(value)),
                validator: (_) => context
                    .read<RegisterFormBloc>()
                    .state
                    .confirmPassword
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            shortPassword: (_) =>
                                'Password must be 8 characters and include at least one uppercase, one lowercase, a symbol and a number',
                            orElse: () => null),
                        (_) => null),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: state.favouriteEplTeam.value.fold(
                    (f) => f.maybeMap(empty: (_) => 'e', orElse: () => null),
                    (r) => r),
                // value: "Saint George S.C",
                isExpanded: true,
                items: [
                  "Saint George S.C",
                  "Wolaita Dicha S.C",
                  "Hawassa Kenema S.C",
                  "Jimma Aba Jifar F.C",
                  "Sidama Coffee S.C",
                  "Addis Ababa City F.C",
                  "Sebeta City F.C",
                  "Adama City S.C",
                  "Fasil Kenema S.C",
                  "Arba Minch City F.C",
                  "Dire Dawa City S.C",
                  "Defence Force S.C",
                  "Wolkite City F.C",
                  "Ethiopian Coffee S.C",
                  "Hadiya Hossana F.C",
                  "Bahir Dar Kenema S.C"
                ].map((String value) {
                  return DropdownMenuItem<String>(
                      child: Text(value), value: value);
                }).toList(),
                onChanged: (value) =>
                    BlocProvider.of<RegisterFormBloc>(context).add(
                  RegisterFormEvent.favoriteEplTeamChanged(value!),
                ),
              ),
              DropdownButton<String>(
                  value: state.country.value.fold(
                      (f) => f.maybeMap(empty: (_) => 'e', orElse: () => null),
                      (r) => r),
                  // value: "Saint George S.C",
                  isExpanded: true,
                  items: [
                    "Ethiopia",
                    "United Kingdom",
                    "United States Of America",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                        child: Text(value), value: value);
                  }).toList(),
                  onChanged: (value) =>
                      BlocProvider.of<RegisterFormBloc>(context)
                          .add(RegisterFormEvent.countryChanged(value!))),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       print(state.favouriteEplTeam);
              //     },
              //     child: Text('e')),
              // const Text(''),
              ElevatedButton(
                onPressed: state.isSubmitting
                    ? null
                    : () {
                        BlocProvider.of<RegisterFormBloc>(context)
                            .add(const RegisterFormEvent.registerUserPressed());
                      },
                child: const Text('Register'),
              ),
            ],
          ),
        );
      },
    );
  }
}
