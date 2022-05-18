import 'package:efpl/application/auth/request_reset_form/request_reset_form_bloc.dart';
import 'package:efpl/presentation/authentication/request_reset/widgets/request_reset_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injectable.dart';

class RequestResetPage extends StatefulWidget {
  const RequestResetPage({Key? key}) : super(key: key);

  @override
  State<RequestResetPage> createState() => _RequestResetPageState();
}

class _RequestResetPageState extends State<RequestResetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Reset Page'),
      ),
      body: BlocProvider(
        create: (context) => getIt<RequestResetFormBloc>(),
        child: const RequestResetForm(),
      ),
    );
  }
}
