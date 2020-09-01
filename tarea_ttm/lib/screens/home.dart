import 'package:flutter/material.dart';
import 'package:tarea_ttm/utils/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sdfsdf'),
      ),
      body: Center(
        child: _logOutBtn(),
      ),
    );
  }

  Widget _logOutBtn() {
    return SizedBox(
      width: 220,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text('Logout'),
        color: Colors.pink[800],
        onPressed: () => {
          _eliminarDatos(),
          print('Datos eliminados'),
        },
        textColor: Colors.white,
      ),
    );
  }

  void _eliminarDatos() async {
    await Data().deleteData('username');
    setState(() {});
  }
}
