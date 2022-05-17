import 'package:efpl/application/auth/request_reset_form/bloc/request_reset_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestResetForm extends StatelessWidget {
  const RequestResetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestResetFormBloc, RequestResetFormState>(
      listener: (context, state) {},
      builder: ((context, state) {
        return Form(child: TextFormField());
      }),
    );
  }
}
