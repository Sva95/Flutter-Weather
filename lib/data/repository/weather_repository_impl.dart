import 'package:flutter_weather/data/api_client.dart';
import 'package:flutter_weather/domain/model/weather.dart';
import 'package:flutter_weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final ApiClient _apiUtil;

  WeatherRepositoryImpl(this._apiUtil);

  @override
  Future<Weather> getWeather({String city}) {
    return _apiUtil.getDay(city: city);
  }
}
