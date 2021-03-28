import 'package:flutter_weather/data/api_client.dart';
import 'package:flutter_weather/data/service/weather_service.dart';

class ApiModule {
  static ApiClient _apiUtil;

  static ApiClient apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiClient(WeatherService());
    }
    return _apiUtil;
  }
}
