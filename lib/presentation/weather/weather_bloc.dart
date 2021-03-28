import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/domain/repository/weather_repository.dart';
import 'package:flutter_weather/presentation/weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({this.repository}) : super(Empty());

  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    try {
      yield Loading();

      if (event is GetWeather) {
        var weather = await repository.getWeather(city: event.city);
        yield Success(weather);
      }

    } catch (e) {
      yield Error(e.toString());
    }
  }
}

abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  String city;

  GetWeather(this.city);
}
