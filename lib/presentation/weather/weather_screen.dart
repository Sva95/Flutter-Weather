import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/di/repository_module.dart';
import 'package:flutter_weather/presentation/weather/weather_bloc.dart';
import 'package:flutter_weather/presentation/weather/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  var weatherRepository = RepositoryModule.weatherRepository();

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<WeatherScreen> {
  final _latController = TextEditingController();
  WeatherBloc _weatherBloc;

  @override
  void initState() {
    _weatherBloc = WeatherBloc(repository: widget.weatherRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => _weatherBloc,
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            body: _getBody(),
          ),
        ));
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getRowInput(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Find out the weather'),
              onPressed: _getDay,
            ),
            SizedBox(height: 20),
            _getDayInfo(),
          ],
        ),
      ),
    );
  }

  void _getDay() {
    var city = _latController.text;
    _weatherBloc.add(GetWeather(city));
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            autofocus: false,
            decoration: InputDecoration(hintText: 'City'),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget _getDayInfo() {
    return  Center(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is Empty) {
                return Text(
                  '',
                  style: TextStyle(fontSize: 20.0),
                );
              }

              if (state is Success) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                        'Temperature in ${state.weather.city}: ${state.weather.temp}°C'),
                  ],
                );
              }

              if (state is Error) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('No Internet Connection'),
                  ],
                );
              }
            },
          ),
        );
  }
}
