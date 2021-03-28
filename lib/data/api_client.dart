import 'package:flutter/material.dart';
import 'package:flutter_weather/data/model/city.dart';
import 'package:flutter_weather/data/service/weather_service.dart';
import 'package:flutter_weather/domain/mapper/weather_mapper.dart';
import 'package:flutter_weather/domain/model/weather.dart';


class ApiClient {
  final WeatherService _weatherService;

  ApiClient(this._weatherService);

  Future<Weather> getDay({@required String city}) async {
    final body = CityBody(cityName: city);
    final result = await _weatherService.getWeather(body);
    return  WeatherMapper.fromApi(result);;
  }
}
