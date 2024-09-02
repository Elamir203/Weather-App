import 'package:flutter/material.dart';

class WeatherFailed extends StatelessWidget {
  final String errMessage;

  const WeatherFailed({Key? key, required this.errMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0 , right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errMessage,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
