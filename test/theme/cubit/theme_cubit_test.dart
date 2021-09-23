import 'package:flutter_weather/theme/theme_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/weather/weather.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';


import '../../helpers/hydrated_bloc.dart';

class MockWeather extends Mock implements Weather {
  MockWeather(this._condition);

  final WeatherCondition _condition;

  @override
  WeatherCondition get condition => _condition;
}

void main() {
  initHydratedBloc();
  group('ThemeCubit', () {
    late ThemeCubit themeCubit;

    setUp(() {
      themeCubit = ThemeCubit();
    });

    tearDown(() {
      themeCubit.close();
    });

    test('initial state is correct', () {
      expect(themeCubit.state, ThemeCubit.defaultColor);
    });

    test('initial state is correct', () {
      expect(themeCubit.state, ThemeCubit.defaultColor);
    });

    group('toJson/fromJson', () {
      final clearWeather = MockWeather(WeatherCondition.clear);
      final snowyWeather = MockWeather(WeatherCondition.snowy);
      final cloudyWeather = MockWeather(WeatherCondition.cloudy);
      final rainyWeather = MockWeather(WeatherCondition.rainy);
      final unknownWeather = MockWeather(WeatherCondition.unknown);
      

      test('work properly', () {
        expect(
            themeCubit.fromJson(themeCubit.toJson(themeCubit.state)),
            themeCubit.state
        );
      });
    });
  });
}
