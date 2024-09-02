class WeatherModel {
  final String cityName;
  final DateTime dateOfSearch;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;
  final String imageOfCondition;

  WeatherModel(
      {required this.cityName,
      required this.dateOfSearch,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition,
      required this.imageOfCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        dateOfSearch:DateTime.parse(json['current']['last_updated']),
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        imageOfCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['icon']);
  }
}
