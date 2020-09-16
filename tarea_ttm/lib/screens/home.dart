import 'package:flutter/material.dart';
import 'package:tarea_ttm/screens/login.dart';
import 'package:tarea_ttm/utils/data.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/home';
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
        title: Text('Home'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido a la página de inicio',
            ),
            Divider(
              color: Colors.deepPurple[300],
              thickness: 1,
            ),
            _logOutBtn(),
          ],
        ),
      ),
    );
  }

  Widget _logOutBtn() {
    return SizedBox(
      width: 220,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text('Logout'),
        color: Colors.red[600],
        textColor: Colors.white,
        onPressed: () => {
          _eliminarDatos(),
          print('Datos eliminados'),
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          )
        },
      ),
    );
  }

  void _eliminarDatos() async {
    await Data().deleteData('username');
    setState(() {});
  }
}
