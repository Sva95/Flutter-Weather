import 'package:flutter/material.dart';
import 'package:flutter_weather/domain/model/weather.dart';

abstract class WeatherState {}

class Success extends WeatherState {
  Weather weather;

  Success(this.weather);
}

class Error extends WeatherState {
  String exception;

  Error(this.exception);
}

class Loading extends WeatherState {
  Loading();
}

class Empty extends WeatherState {}
