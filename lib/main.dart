import 'package:flutter/material.dart';
import 'package:untitled7/pages/home.dart';
import 'package:untitled7/pages/loading.dart';
import 'package:untitled7/pages/choose_location.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
       '/location' : (context) => ChooseLocation(),
    },
  ));
}

