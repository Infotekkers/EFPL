import 'package:efpl/application/util/util_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get The bloc value from the provider
    final UtilBloc _utilBloc = BlocProvider.of<UtilBloc>(context);
    // _utilBloc.add(const UtilEvent.setDefaultLocale());

    return BlocConsumer<UtilBloc, UtilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: Text(
                AppLocalizations.of(context)!.currentLanguage,
              ),
            ),
            Center(
              child: Text(
                state.locale.toString(),
              ),
            ),
            TextButton(
              onPressed: () {
                state.locale == const Locale("en")
                    ? _utilBloc.add(
                        const UtilEvent.setLocale(
                          newLocale: Locale("am"),
                        ),
                      )
                    : _utilBloc.add(
                        const UtilEvent.setLocale(
                          newLocale: Locale("en"),
                        ),
                      );
              },
              child: state.locale == const Locale("en")
                  ? const Text("am")
                  : const Text("en"),
            ),
          ],
        );
      },
    );
  }
}
