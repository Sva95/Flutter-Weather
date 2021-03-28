import 'package:flutter_weather/data/model/weatherResponse.dart';
import 'package:flutter_weather/domain/model/weather.dart';

class WeatherMapper {
  static Weather fromApi(WeatherResponse weatherResponse) {
    return Weather(
        temp: (weatherResponse.main.temp - 273.15).roundToDouble(),
        city: weatherResponse.name);
  }
}
