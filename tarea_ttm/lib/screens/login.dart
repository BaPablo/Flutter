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

  // Usuario de prueba
  Map<String, String> usuario = {
    'nombreUsuario': 'John',
    'password': 'Password1'
  };

  @override
  void initState() {
    super.initState();
    _obtenerDatos(datos: ['username']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[300],
        title: Text(
          'Login',
          textAlign: TextAlign.center,
        ),
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
      width: 220,
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: usernameController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          hintText: 'Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      alignment: Alignment.center,
      width: 220,
      margin: EdgeInsets.all(5),
      child: TextFormField(
        controller: passwordController,
        textAlign: TextAlign.center,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return SizedBox(
      width: 220,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text('Iniciar sesión'),
        color: Colors.lightBlue[600],
        textColor: Colors.white,
        onPressed: () => {
          print('Username: ' + usernameController.text),
          print('Password: ' + passwordController.text),

          // Validación contra datos del Map

          if (usernameController.text == usuario['nombreUsuario'] &&
              passwordController.text == usuario['password'])
            {
              print('Login correcto'),
              _guardarDatos(),
              print('Datos guardados'),
              Navigator.of(context).pushReplacementNamed(HomeScreen.tag)
            }
          else
            {
              _showAlert(),
            }
        },
      ),
    );
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Datos de acceso incorrectos"),
          content: Text(
              "Revise que el nombre de usuario y contraseña ingresados sean correctos"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
