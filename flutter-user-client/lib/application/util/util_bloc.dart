import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shared_preferences/shared_preferences.dart';
part 'util_event.dart';
part 'util_state.dart';
part 'util_bloc.freezed.dart';

@lazySingleton
class UtilBloc extends Bloc<UtilEvent, UtilState> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UtilBloc()
      : super(
          UtilState.initial(),
        ) {
    on<_SetDefaultLocale>((event, emit) async {
      final SharedPreferences prefs = await _prefs;
      String defaultLocale = "en";
      try {
        defaultLocale =
            prefs.getString("lang")!.isEmpty ? 'en' : prefs.getString("lang")!;
      } catch (e) {
        // print(e);
      }

      emit(
        state.copyWith(
          locale: Locale(defaultLocale),
        ),
      );
    });

    on<_SetLocale>((event, emit) async {
      final SharedPreferences prefs = await _prefs;

      prefs.setString("lang", event.newLocale.toString());

      emit(state.copyWith(locale: event.newLocale));
    });

    on<_ClearLocale>((event, emit) {
      emit(state.copyWith(
        locale: const Locale("en"),
      ));
    });
  }
}
