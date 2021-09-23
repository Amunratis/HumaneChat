import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/weather/weather.dart';
import 'package:flutter_weather/weather/widgets/weather_populated.dart';

void main() {
  group('WeatherPopulated', () {
    final weather = Weather(
      condition: WeatherCondition.clear,
      lastUpdated: DateTime(2020),
      location: 'Chicago',
      temperature: Temperature(value: 42),
    );

    testWidgets('renders correct emoji (clear)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherPopulated(
              weather: weather,
              units: TemperatureUnits.fahrenheit,
              onRefresh: () async {},
            ),
          ),
        ),
      );
      expect(find.text('☀'), findsOneWidget);
    });

    testWidgets('renders correct emoji (rainy)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherPopulated(
              weather: weather.copyWith(condition: WeatherCondition.rainy),
              units: TemperatureUnits.fahrenheit,
              onRefresh: () async {},
            ),
          ),
        ),
      );
      expect(find.text('❓'), findsOneWidget);
    });

    testWidgets('renders correct emoji (cloudy)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherPopulated(
              weather: weather.copyWith(condition: WeatherCondition.cloudy),
              onRefresh: () async {},
              units: TemperatureUnits.fahrenheit,
            ),
          ),
        ),
      );
      expect(find.text('☁'), findsOneWidget);
    });

    testWidgets('renders correct emoji (snowy)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
                body: WeatherPopulated(
          weather: weather.copyWith(condition: WeatherCondition.snowy),
          onRefresh: () async {},
          units: TemperatureUnits.fahrenheit,
        ))),
      );
      expect(find.text('🌨'), findsOneWidget);
    });

    testWidgets('renders correct emoji (unknown)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
                body: WeatherPopulated(
          weather: weather.copyWith(condition: WeatherCondition.unknown),
          onRefresh: () async {},
          units: TemperatureUnits.fahrenheit,
        ))),
      );
      expect(find.text('❓'), findsOneWidget);
    });
  });
}
