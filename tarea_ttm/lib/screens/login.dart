import 'package:flutter/material.dart';
import 'package:tarea_ttm/screens/home.dart';

final userNameController = TextEditingController();
final passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
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
          _buildLoginBtn(context),
        ],
      ),
    );
  }
}

Widget _buildUsernameField() {
  return Container(
    child: TextFormField(
      controller: userNameController,
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

Widget _buildLoginBtn(context) {
  return SizedBox(
    width: 220,
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text('Login'),
      color: Colors.lightBlue[600],
      onPressed: () => {
        print(userNameController.text),
        print(passwordController.text),
        if (userNameController.text == 'John')
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          }
        else
          {print('Advertencia login incorrecto')}
      },
      textColor: Colors.white,
    ),
  );
}
