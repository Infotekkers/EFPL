import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';

class AuthLocaleWidget extends StatelessWidget {
  const AuthLocaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String currentLocale = getIt<UtilBloc>().state.locale.toString();
        getIt<UtilBloc>().add(
          UtilEvent.setLocale(
            newLocale:
                currentLocale == "en" ? const Locale("am") : const Locale("en"),
          ),
        );
      },
      child: Container(
        width: 40,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: ConstantColors.primary_900.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(
                0,
                3,
              ), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            getIt<UtilBloc>().state.locale.toString() == "en"
                ? 'assets/images/usa-flag.png'
                : 'assets/images/ethiopian-flag.png',
            fit: BoxFit.fill,
          ),
        ),
        // child: Text(
        //   getIt<UtilBloc>().state.locale.toString(),
        // ),
      ),
    );
  }
}