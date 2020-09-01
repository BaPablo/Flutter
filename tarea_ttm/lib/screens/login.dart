import 'package:flutter/material.dart';
import 'package:tarea_ttm/screens/home.dart';
import 'package:tarea_ttm/utils/data.dart';

class LoginScreen extends StatefulWidget {
  static String tag = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _obtenerDatos(datos: ['username']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.tealAccent[300],
      ),
      body: ListView(
        children: <Widget>[
          _buildUsernameField(),
          _buildPasswordField(),
          _buildLoginBtn(),
        ],
      ),
    );
  }

  Widget _buildUsernameField() {
    return Container(
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          hintText: 'Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        textAlign: TextAlign.center,
      ),
      width: 220,
      margin: EdgeInsets.all(10),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        textAlign: TextAlign.center,
        obscureText: true,
      ),
      width: 220,
      margin: EdgeInsets.all(5),
    );
  }

  Widget _buildLoginBtn() {
    return SizedBox(
      width: 220,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text('Login'),
        color: Colors.lightBlue[600],
        onPressed: () => {
          print(usernameController.text),
          print(passwordController.text),
          if (usernameController.text == 'John' &&
              passwordController.text == 'Password1')
            {
              print('Login correcto'),
              _guardarDatos(),
              Navigator.of(context).pushReplacementNamed(HomeScreen.tag)
            }
          else
            {print('Advertencia login incorrecto')}
        },
        textColor: Colors.white,
      ),
    );
  }

  void _obtenerDatos({List<String> datos}) async {
    for (String nombreDato in datos) {
      bool exist = await Data().checkData(nombreDato);
      if (exist) {
        String datoObtenido = await Data().getData(nombreDato);
        if (nombreDato == 'username') {
          usernameController.text = datoObtenido;
        }
      }
    }
    setState(() {});
  }

  void _guardarDatos() async {
    await Data().saveData('username', usernameController.text);
    setState(() {});
  }
}
