import 'dart:convert';
import 'package:tarea2_ttm/models/hero.dart' as hero;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomeScreen extends StatelessWidget {
  final String urlJSON = 'https://www.hectoralvarez.dev/icc727/heroes.json';
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': 'something'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          _hero(),
          RaisedButton(
            onPressed: getHeroes,
            child: Text('Press me bro'),
          ),
        ],
      ),
    );
  }

  Widget _hero() {
    return Container();
  }

  Future<void> getHeroes() async {
    final response = await http.get(this.urlJSON, headers: this._headers);
    Map heroesMap = jsonDecode(response.body);
    var heroes = heroesMap['heroes'];
    print(heroes);
  }
}
