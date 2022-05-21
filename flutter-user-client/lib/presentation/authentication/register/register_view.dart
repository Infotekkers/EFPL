import 'package:efpl/presentation/authentication/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/auth/register_form/register_form_bloc.dart';
import '../../../application/util/util_bloc.dart';
import '../../../injectable.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilBloc _utilBloc = getIt<UtilBloc>();
    _utilBloc.add(const UtilEvent.setDefaultLocale());
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the Login Page'),
      ),
      body: BlocProvider(
        create: (context) => getIt<RegisterFormBloc>(),
        child: const RegisterForm(),
      ),
    );
  }
}
