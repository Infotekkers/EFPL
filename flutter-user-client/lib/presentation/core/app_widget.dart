import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/locale/l10n.dart';
import 'package:efpl/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter _appRouter = AppRouter();

    return BlocProvider(
      create: (context) =>
          getIt<UtilBloc>()..add(const UtilEvent.setDefaultLocale()),
      child: BlocConsumer<UtilBloc, UtilState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            title: 'Flutter Demo',
            theme: ThemeData(
                // Background Colors
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.blue,
                )
                    .copyWith(
                      secondary: Colors.amber,
                    )
                    .copyWith(
                      tertiary: Colors.black,
                    ),

                // text styles
                textTheme: const TextTheme(
                  headline1: TextStyle(
                    fontSize: 72.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontFamily: "Architect",
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
            initialRoute: "/",
            routes: _appRouter.allRoutes,
          );
        },
      ),
    );
  }
}
