import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './location_screen.dart';
import 'package:clima/services/weather.dart';

final spinkit = SpinKitDoubleBounce(
  color: Colors.white,
  size: 50.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  WeatherModel weatherModel = WeatherModel();

  void getLocationData() async {
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LocationScreen(locationWeather: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: spinkit),
    );
  }
}
