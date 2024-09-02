import 'package:flutter/material.dart';

class NoWeatherYet extends StatelessWidget {
  const NoWeatherYet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Searched City Yet ',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  'Start Searching Now',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.search,
                size: 33,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
