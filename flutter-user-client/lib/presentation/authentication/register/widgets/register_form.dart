import 'package:efpl/application/auth/register_form/register_form_bloc.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/services/snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                      message: "Process Cancelled by User",
                      snackBarType: "warning",
                    );
                  },
                  emailAlreadyInUse: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Credential Issue",
                      message: "Email Already In Use",
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
                  passwordDontMatch: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: 'Password do not match',
                      message: "Passwords must match",
                      snackBarType: 'warning',
                      showDuration: 2,
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
            children: [
              // Email Input
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  labelText: AppLocalizations.of(context)!.email,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
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
              const SizedBox(height: 15),

              // Username input
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.person),
                  labelText: AppLocalizations.of(context)!.userName,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
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

              const SizedBox(height: 15),

              // Team Name Input
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.sports_soccer),
                  labelText: AppLocalizations.of(context)!.teamName,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
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

              const SizedBox(height: 15),

              // Password Input
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.lock),
                  labelText: AppLocalizations.of(context)!.password,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
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
                  suffixIcon: IconButton(
                    icon: Icon(state.showPass
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      BlocProvider.of<RegisterFormBloc>(context)
                          .add(const RegisterFormEvent.showPressed());
                    },
                  ),
                ),
                autocorrect: false,
                obscureText: !state.showPass,
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

              const SizedBox(height: 15),

              // Confirm Password
              TextFormField(
                // keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.lock),
                  labelText: AppLocalizations.of(context)!.confirmPassword,
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
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
                  suffixIcon: IconButton(
                    icon: Icon(state.showConfirmPass
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      BlocProvider.of<RegisterFormBloc>(context)
                          .add(const RegisterFormEvent.showConfirmPressed());
                    },
                  ),
                ),
                autocorrect: false,
                obscureText: !state.showConfirmPass,
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

              const SizedBox(height: 15),

              // Drop Down
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
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      value: value);
                }).toList(),
                onChanged: (value) =>
                    BlocProvider.of<RegisterFormBloc>(context).add(
                  RegisterFormEvent.favoriteEplTeamChanged(value!),
                ),
              ),

              const SizedBox(height: 15),

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
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        value: value);
                  }).toList(),
                  onChanged: (value) =>
                      BlocProvider.of<RegisterFormBloc>(context)
                          .add(RegisterFormEvent.countryChanged(value!))),

              const SizedBox(
                height: 24,
              ),

              // Register Button
              InkWell(
                onTap: () {
                  state.isSubmitting
                      ? null
                      : BlocProvider.of<RegisterFormBloc>(context).add(
                          const RegisterFormEvent.registerUserPressed(),
                        );
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
                      AppLocalizations.of(context)!.signUp,
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

              const SizedBox(height: 36),

              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    "/sign-in",
                  );
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        // Normal text
                        TextSpan(
                          text: AppLocalizations.of(context)!
                                  .alreadyHaveAnAccount +
                              " ?",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey.withOpacity(0.85),
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),

                        // Redirect
                        TextSpan(
                          text: " " + AppLocalizations.of(context)!.signIn,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
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
