import 'package:flutter/foundation.dart';
import 'package:flutter_weather/domain/model/weather.dart';



abstract class WeatherRepository {
  Future<Weather> getWeather({@required String city});
}
