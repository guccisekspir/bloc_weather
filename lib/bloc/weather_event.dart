import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent{
  final String sehirAdi;

  FetchWeatherEvent({@required this.sehirAdi});

  @override
  // TODO: implement props
  List<Object> get props => null;
}
