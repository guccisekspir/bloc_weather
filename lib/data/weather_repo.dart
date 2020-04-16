import 'package:bloc_deneme/data/weather_api_client.dart';
import 'package:bloc_deneme/locator.dart';
import 'package:bloc_deneme/models/weather.dart';

class WeatherRepo{

  WeatherApiClient weatherApiClient= locator<WeatherApiClient>();
  Future<Weather> getWheather(String sehir)async{

    final int cityID=await weatherApiClient.getLocationID(sehir);
    return await weatherApiClient.getWeather(cityID);

  }
}