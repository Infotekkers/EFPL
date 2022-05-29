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
                  headlineText: "Success!",
                  message: "Email Successfully sent",
                  snackBarType: "success",
                );
              },
            );
          },
        );
      },
      builder: ((context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              const Text(
                'Input your email so we can send reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                key: const ValueKey("requestPageUserName"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
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
              Row(
                children: [
                  TextButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                            BlocProvider.of<RequestResetFormBloc>(context).add(
                                const RequestResetFormEvent.requestPressed());
                          },
                    child: const Text(
                      'Request Password Reset',
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
