import 'package:bloc_deneme/bloc/bloc.dart';
import 'package:bloc_deneme/locator.dart';
import 'package:bloc_deneme/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<WeatherBloc>(
          create: (context)=> WeatherBloc(),

            child: WeatherApp()));
  }
}
