import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarea_ttm/screens/home.dart';
import 'package:tarea_ttm/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString('username');
  print(user);

  runApp(MaterialApp(home: user == null ? LoginScreen() : HomeScreen()));
}
