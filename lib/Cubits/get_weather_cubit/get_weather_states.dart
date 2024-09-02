import '../../Models/weather_model.dart';

class WeatherState{}

class NoWeatherYetState extends WeatherState{}

class WeatherInfoLoadedState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherInfoLoadedState(this.weatherModel);
}

class WeatherInfoFailedState extends WeatherState{
  final String errMessage;
  WeatherInfoFailedState(this.errMessage);
}
