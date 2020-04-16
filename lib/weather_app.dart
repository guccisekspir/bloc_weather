import 'dart:ui';

import 'package:bloc_deneme/bloc/bloc.dart';
import 'package:bloc_deneme/location_widget.dart';
import 'package:bloc_deneme/maxmin_heat_widget.dart';
import 'package:bloc_deneme/select_city_page.dart';
import 'package:bloc_deneme/son_g%C3%BCncelleme_widget.dart';
import 'package:bloc_deneme/weather_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatelessWidget {
  String selectedCity = "Ankara";

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              selectedCity = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SehirSecWidget()));
              if (selectedCity != null) {
                _weatherBloc.add(FetchWeatherEvent(sehirAdi: selectedCity));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if(state is InitialWeatherState){
              return Center(child: Text("Şehir Seçilmedi"),);
            }
            if(state is WeatherLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is WeatherLoadedState){
              final fetchedWeather = state.weather;
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: LocationWidget(secilenSehir: fetchedWeather.title,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: SonGuncellemeWidget()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: WheatherIconWidget()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: MaxMinHeatWidget()),
                  ),
                ],
              );
            }

            if(state is WeatherErrorState){
              return Center();
            }
            else{
              return Center();
            }
          }
        ),
      ),
    );
  }
}
