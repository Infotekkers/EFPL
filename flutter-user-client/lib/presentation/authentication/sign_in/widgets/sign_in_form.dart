import 'package:efpl/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
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
                  invalidEmailPasswordCombination: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Credentials Issue",
                      message: "Invalid Email - Password combination",
                      snackBarType: "warning",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email Input
              TextFormField(
                key: const ValueKey("loginViewUserName"),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  labelText: AppLocalizations.of(context)!.email,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: ConstantColors.primary_900.withOpacity(0.55),
                      ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ConstantColors.primary_900,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 15.0,
                  ),
                ),
                autocorrect: false,
                onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                    .add(SignInFormEvent.emailChanged(value)),
                validator: (_) => context
                    .read<SignInFormBloc>()
                    .state
                    .email
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null),
                        (_) => null),
              ),

              const SizedBox(height: 15),

              // Password Input

              TextFormField(
                key: const ValueKey("loginViewPassword"),
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.lock),
                  labelText: AppLocalizations.of(context)!.password,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        color: ConstantColors.primary_900.withOpacity(0.55),
                      ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ConstantColors.primary_900,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 10.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(state.showPass
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      BlocProvider.of<SignInFormBloc>(context)
                          .add(const SignInFormEvent.showPressed());
                    },
                  ),
                ),
                autocorrect: false,
                obscureText: !state.showPass,
                onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                    .add(SignInFormEvent.passwordChanged(value)),
                validator: (_) => context
                    .read<SignInFormBloc>()
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
              const SizedBox(
                height: 24,
              ),

              // Sign In Button
              InkWell(
                key: const Key("loginViewLoginButton"),
                onTap: () {
                  state.isSubmitting
                      ? null
                      : BlocProvider.of<SignInFormBloc>(context)
                          .add(const SignInFormEvent.signInUserPressed());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 42,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    // color: Colors.amber,
                    color: ConstantColors.primary_900,
                  ),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.signIn,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.25,
                            fontSize: 15,
                          ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Reset Button
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/request-reset");
                },
                child: Text(
                  AppLocalizations.of(context)!.forgotPassword,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey.withOpacity(0.85),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                ),
              ),

              const SizedBox(height: 36),

              InkWell(
                key: const Key("loginViewSignUpRedirect"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/register");
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        // Normal text
                        TextSpan(
                          text: AppLocalizations.of(context)!.dontHaveAnAccount,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey.withOpacity(0.85),
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),

                        // Redirect
                        TextSpan(
                          text: " " + AppLocalizations.of(context)!.signUp,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
