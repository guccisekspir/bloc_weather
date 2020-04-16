import 'package:bloc_deneme/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SonGuncellemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
        builder: (context, WeatherState state){
        var tarih = (state as WeatherLoadedState).weather.time.toLocal();

        return Text("Son Güncelleme"+ TimeOfDay.fromDateTime(tarih).format(context));

        });
  }
}
