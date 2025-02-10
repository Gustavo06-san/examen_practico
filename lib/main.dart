import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyHomeApp());
}

class MyHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,  // Cambiar el tema a azul
      ),
      home: HomeScreen(),
    );
  }
}
