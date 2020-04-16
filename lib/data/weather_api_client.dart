import 'package:bloc_deneme/models/weather.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class WeatherApiClient{

  static const baseUrl= "https://www.metaweather.com";
  final http.Client httpClien = http.Client();

  Future<int> getLocationID(String cityName)async{
    final sehirURL = baseUrl+"/api/location/search/?query=$cityName";
    final responser = await httpClien.get(sehirURL);
    if(responser.statusCode !=200){
      throw Exception("Veri Getirilemedi");
    }

    final responseJSON=(jsonDecode(responser.body))as List;
    return responseJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async{
    final havaDurumuURL=baseUrl+"/api/location/$sehirID/";
    final havaResponse= await httpClien.get(havaDurumuURL);
    if(havaResponse.statusCode !=200){
      throw Exception("Veri Getirilemedi");
    }
    final responseJSONhava= (jsonDecode(havaResponse.body));
    return Weather.fromJson(responseJSONhava);

  }


}