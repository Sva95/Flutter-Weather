import 'package:dio/dio.dart';
import 'package:flutter_weather/data/model/city.dart';
import 'package:flutter_weather/data/model/weatherResponse.dart';


class WeatherService {
  static const _BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  static const _APPID = '876c18ced99d68e93d22a8cf316a8e4f';

  final Dio _dio = Dio(BaseOptions(
      baseUrl: _BASE_URL, receiveTimeout: 5000, connectTimeout: 5000));

  Future<WeatherResponse> getWeather(CityBody cityBody) async {
    Map<String, String> queryParams = {'q': cityBody.cityName, 'appid': _APPID};

    //_dio.interceptors.add(CustomInterceptors());

    final response = await _dio.get(
      '',
      queryParameters: queryParams,
    );
    queryParams.clear();
    return WeatherResponse.fromJson(response.data);
  }
}

/*class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {

    print("URI[${options?.uri}] => QueryParameters: ${options?.queryParameters}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "RESPONSE[${response?.data}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}*/
