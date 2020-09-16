import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tarea2_ttm/services/hero_service.dart';
import 'package:tarea2_ttm/utils/connected.dart';
import 'package:tarea2_ttm/models/heroes.dart';
import 'package:tarea2_ttm/utils/json_icon_util.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String mensajeConn = '';
  Heroes heroes = Heroes();

  void checkConn() async {
    bool connectionAvailable = await Connected().isConnected();

    (connectionAvailable)
        ? this.mensajeConn = 'Si hay conexión'
        : this.mensajeConn = 'No hay conexión';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 2'),
      ),
      body: Container(
        child: _showHeroes(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'btnList',
            backgroundColor: Colors.red[900],
            child: Icon(Icons.hearing),
            onPressed: (() => this.getList()),
          ),
        ],
      ),
    );
  }

  Widget _showHeroes() {
    if (this.heroes.heroes != null) {
      return Container(
        height: 475,
        margin: EdgeInsets.only(bottom: 30),
        child: ListView.builder(
          itemCount: this.heroes.heroes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(this.heroes.heroes[index].nombre),
              subtitle: Text(
                utf8.decode(
                  this.heroes.heroes[index].poder.runes.toList(),
                ),
              ),
              leading: getIcon(this.heroes.heroes[index].icon,
                  this.heroes.heroes[index].color),
              trailing: Icon(Icons.keyboard_arrow_right),
            );
          },
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        'Presione el botón para ver nuestro listado de héroes disponibles :)',
        textAlign: TextAlign.justify,
      ),
    );
  }

  void getList() async {
    bool connectionAvailable = await Connected().isConnected();
    (connectionAvailable)
        ? this.heroes = await TestService().getLista()
        : print('No hay conexión');

    if (this.heroes != null) {
      setState(() {});
    }
  }

  void postSaludo() async {
    bool connectionAvailable = await Connected().isConnected();
    (connectionAvailable)
        ? TestService().postGreeting()
        : print('No hay internet');
  }
}
