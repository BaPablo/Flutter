import 'package:flutter/material.dart';
import 'package:tarea_ttm/screens/home.dart';
import 'package:tarea_ttm/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool _logged = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (BuildContext context) {
        if (_logged) {
          return HomeScreen();
        } else
          return LoginScreen();
      }
    });
  }
}
