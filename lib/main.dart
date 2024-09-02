import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/Views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          // final weatherModel = BlocProvider
          //     .of<GetWeatherCubit>(context)
          //     .weatherModel;
          // final weatherCondition = weatherModel?.weatherCondition;
          // final themeColor = getThemeColor(weatherCondition);
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition)
                 // primaryColor: themeColor,
                 //  colorScheme: ColorScheme.fromSwatch(
                 //      primarySwatch: themeColor),
                ),
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Blowing snow':
    case 'Blizzard':
    case 'Heavy snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Patchy moderate snow':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.lightBlue;
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Patchy light rain with thunder':
    case 'Patchy light snow showers':
    case 'Patchy showers of ice pellets':
      return Colors.lightBlue;
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blue;
    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
      return Colors.amber;
    case 'Ice pellets':
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}
