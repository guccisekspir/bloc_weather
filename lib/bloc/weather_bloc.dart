import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_deneme/data/weather_repo.dart';
import 'package:bloc_deneme/locator.dart';
import 'package:bloc_deneme/models/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo = locator<WeatherRepo>();
  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeatherEvent){
      yield WeatherLoadingState();
      try{
        final Weather weather= await weatherRepo.getWheather(event.sehirAdi);
        yield WeatherLoadedState(weather: weather);
      }catch(e){
        yield WeatherErrorState();
      }
    }
    // TODO: Add Logic
  }
}
