import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/Views/search_view.dart';
import 'package:weather_app/Widgets/no_weather_yet.dart';
import 'package:weather_app/Widgets/weather_failed.dart';
import 'package:weather_app/Widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherYetState) {
            return const NoWeatherYet();
          } else if (state is WeatherInfoLoadedState) {
            return WeatherInfo(weatherModel: state.weatherModel);
          } else if (state is WeatherInfoFailedState) {
            return WeatherFailed(errMessage: state.errMessage);
          } else {
            return const Text('Opps there is an error, Try again');
          }
        },
      ),
    );
  }
}
