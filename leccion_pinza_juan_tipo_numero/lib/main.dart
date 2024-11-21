import 'package:flutter/material.dart';
import 'pages/ejercicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Parcial Pinza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NumberCheckScreen(),
    );
  }
}
