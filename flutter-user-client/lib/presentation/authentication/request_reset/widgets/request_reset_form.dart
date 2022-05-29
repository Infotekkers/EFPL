import 'package:efpl/application/auth/request_reset_form/request_reset_form_bloc.dart';
import 'package:efpl/services/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestResetForm extends StatelessWidget {
  const RequestResetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestResetFormBloc, RequestResetFormState>(
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
                  emailNotFound: (_) {
                    CustomSnackBar().showCustomSnackBar(
                      showContext: context,
                      headlineText: "Credential Issue",
                      message: "Email Not Found",
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
                CustomSnackBar().showCustomSnackBar(
                  showContext: context,
                  headlineText: "Success",
                  message: "Email Successfully Sent",
                  snackBarType: "success",
                  showDuration: 1,
                );
                Navigator.popAndPushNamed(context, '/sign-in');
              },
            );
          },
        );
      },
      builder: ((context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              const Text(
                'Input your email so we can send an email to reset your password',
                // textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                key: const ValueKey("requestPageUserName"),
                decoration: const InputDecoration(
                  // prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 15.0,
                  ),
                ),
                autocorrect: false,
                onChanged: (value) =>
                    BlocProvider.of<RequestResetFormBloc>(context)
                        .add(RequestResetFormEvent.emailChanged(value)),
                validator: (_) => context
                    .read<RequestResetFormBloc>()
                    .state
                    .email
                    .value
                    .fold(
                        (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null),
                        (_) => null),
              ),

              const SizedBox(
                height: 25,
              ),

              // Reset Button
              InkWell(
                onTap: () {
                  state.isSubmitting
                      ? null
                      : BlocProvider.of<RequestResetFormBloc>(context).add(
                          const RequestResetFormEvent.requestPressed(),
                        );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    // color: Colors.amber,
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
