import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/blocs.dart';
import 'package:flutter_weather/bloc/setting_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/repositories/repositaries.dart';
import './widgets/widgets.dart';

import './simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider<SettingsBloc>(
        create: (context) => SettingsBloc(),
      ),
    ],
    child: App(
      weatherRepository: WeatherRepository(
          weatherApiClient: WeatherApiClient(httpClient: http.Client())),
    ),
  ));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themestate) {
        return MaterialApp(
          theme: themestate.theme,
          title: 'Flutter Weather',
          home: BlocProvider(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository),
            child: Weather(),
          ),
        );
      },
    );
  }
}
