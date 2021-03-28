import 'package:flutter_weather/data/repository/weather_repository_impl.dart';
import 'package:flutter_weather/domain/repository/weather_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static WeatherRepository _dayRepository;

  static WeatherRepository weatherRepository() {
    if (_dayRepository == null) {
      _dayRepository = WeatherRepositoryImpl(ApiModule.apiUtil());
    }
    return _dayRepository;
  }
}
