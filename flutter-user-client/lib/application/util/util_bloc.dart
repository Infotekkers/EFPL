import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shared_preferences/shared_preferences.dart';
part 'util_event.dart';
part 'util_state.dart';
part 'util_bloc.freezed.dart';

@injectable
class UtilBloc extends Bloc<UtilEvent, UtilState> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UtilBloc()
      : super(
          UtilState.initial(),
        ) {
    on<_SetDefaultLocale>((event, emit) async {
      try {
        final SharedPreferences prefs = await _prefs;
        String defaultLocale =
            prefs.getString("lang")!.isEmpty ? 'en' : prefs.getString("lang")!;
        emit(
          UtilState(
            locale: Locale(defaultLocale),
          ),
        );
      } catch (e) {
        emit(
          const UtilState(
            locale: Locale("en"),
          ),
        );
      }
    });

    on<_SetLocale>((event, emit) async {
      final SharedPreferences prefs = await _prefs;

      prefs.setString("lang", event.newLocale.toString());

      emit(UtilState(locale: event.newLocale));
    });

    on<_ClearLocale>((event, emit) {
      emit(
        const UtilState(
          locale: Locale("en"),
        ),
      );
    });
  }
}
