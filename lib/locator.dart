import 'package:bloc_deneme/data/weather_api_client.dart';
import 'package:bloc_deneme/data/weather_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepo());
  locator.registerLazySingleton(() => WeatherApiClient());
}