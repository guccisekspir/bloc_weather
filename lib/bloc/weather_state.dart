import 'package:equatable/equatable.dart';
import 'package:bloc_deneme/models/weather.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class InitialWeatherState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WeatherLoadedState extends WeatherState{
  final Weather weather;

  WeatherLoadedState({@required this.weather});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class WeatherErrorState extends WeatherState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}
