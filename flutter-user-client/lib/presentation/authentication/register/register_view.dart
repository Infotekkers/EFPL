import 'package:efpl/application/auth/register_form/register_form_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/authentication/register/widgets/register_form.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:efpl/presentation/core/auth_locale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key("registerViewScrollList"),
        physics: const ClampingScrollPhysics(),
        child: BlocProvider(
          create: (context) => getIt<RegisterFormBloc>(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                // Top Section
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset(
                    'assets/images/main-bg.jpg',
                    fit: BoxFit.fill,
                  ),
                ),

                // Register Form
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(35, 30, 35, 5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.signUp,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: ConstantColors.primary_900,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      fontSize: 20,
                                    ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const RegisterForm()
                        ],
                      ),
                    ),
                  ),
                ),

                // LOCALE BUTTON
                const Positioned(
                  right: 10,
                  bottom: 10,
                  child: AuthLocaleWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
