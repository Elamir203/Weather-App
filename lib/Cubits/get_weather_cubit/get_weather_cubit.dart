import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/Models/weather_model.dart';
import '../../Services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherYetState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
      await WeatherServices(Dio()).getWeatherNow(cityName: cityName);
      emit(WeatherInfoLoadedState(weatherModel!));
    } catch (e) {
      if (e is Exception) {
        emit(WeatherInfoFailedState(e.toString()));
      } else {
        emit(WeatherInfoFailedState('Opps there is an error, Try again'));
      }
    }
  }
}
