import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransfersView extends StatelessWidget {
  const TransfersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.transfers,
      ),
    );
  }
}
