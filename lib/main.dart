import 'package:flutter/material.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';
import 'package:worldclock/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    // routes is map method in which different routes are mentioned
    // context is simple way of referencing where in widget tree we currently are
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => HomeState(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
