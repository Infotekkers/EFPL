import 'package:efpl/application/auth/auth/auth_bloc.dart';
import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/locale/l10n.dart';
import 'package:efpl/presentation/routes/routes.dart';
import 'package:efpl/services/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();

    final AuthBloc _authBloc = getIt<AuthBloc>()
      ..add(
        const AuthEvent.authCheckRequested(),
      );
    _authBloc.add(
      const AuthEvent.tokenCheckRequested(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UtilBloc>()
            ..add(
              const UtilEvent.setDefaultLocale(),
            ),
        ),
        BlocProvider.value(value: _authBloc),
        // BlocProvider(
        //   create: (context) => getIt<AuthBloc>()
        //     ..add(
        //       const AuthEvent.tokenCheckRequested(),
        //     ),
        // )
      ],
      child: BlocConsumer<UtilBloc, UtilState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            title: 'EFPL',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            initialRoute: "/",
            routes: _appRouter.allRoutes,
          );
        },
      ),
    );
  }
}
