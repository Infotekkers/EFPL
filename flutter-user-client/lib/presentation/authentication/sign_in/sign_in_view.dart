import 'package:efpl/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:efpl/presentation/authentication/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/util/util_bloc.dart';
import '../../../injectable.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the Login Page'),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: const SignInForm(),
      ),
    );
  }
}
