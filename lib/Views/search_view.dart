import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          'Search A City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName : value);
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
                log(value);
              });
            },
            decoration: const InputDecoration(
              contentPadding:
                  (EdgeInsets.symmetric(vertical: 30, horizontal: 14)),
              label: Text(
                'Search',
                style: TextStyle(fontSize: 18),
              ),
              hintText: 'Enter City Name',
              suffixIcon: Icon(
                Icons.search,
                size: 22,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
WeatherModel? weatherModel;