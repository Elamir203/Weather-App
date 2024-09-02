import 'dart:developer';
import 'package:dio/dio.dart';
import '../Models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '423d4bb7375d4fe8ab9213743231012';
  WeatherServices(this.dio);
  Future<WeatherModel> getWeatherNow({required String cityName}) async {
    /*here we used try-catch and didn't check the status code as dio package
    checks the status code it self if it is 200 it gives response ,
    else it gives dio exception*/

    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}
