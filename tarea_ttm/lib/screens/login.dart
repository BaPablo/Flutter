import 'package:flutter/material.dart';
import 'package:tarea_ttm/screens/home.dart';

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'User',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              width: 220,
              margin: EdgeInsets.all(10),
            ),
            Container(
              alignment: Alignment.center,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                textAlign: TextAlign.center,
                obscureText: true,
              ),
              width: 220,
              margin: EdgeInsets.all(5),
            ),
            SizedBox(
              width: 220,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text('Login'),
                color: Colors.lightBlue[600],
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                },
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
