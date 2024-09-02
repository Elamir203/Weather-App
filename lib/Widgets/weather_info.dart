import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/main.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel weatherModel;
  WeatherInfo({Key? key, required this.weatherModel}) : super(key: key);

  late String minutes;

  @override
  Widget build(BuildContext context) {
    if (weatherModel.dateOfSearch != null) {
      final dateOfSearch = weatherModel.dateOfSearch!;
      minutes = dateOfSearch.minute < 10 ? '0${dateOfSearch.minute}' : dateOfSearch.minute.toString();
    } else {
      minutes = '';
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Updated At ${weatherModel.dateOfSearch?.hour}:${minutes}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  //url of image from api is missing this part(https:).
                  child: Image.network("https:${weatherModel.imageOfCondition}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    weatherModel.avgTemp.round().toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Text(
                        'max temp : ${weatherModel.maxTemp.round()}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'min temp : ${weatherModel.minTemp.round()}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
