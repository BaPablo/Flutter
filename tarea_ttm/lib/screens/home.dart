import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
}

Widget _logOutBtn() {
  return SizedBox(
    width: 220,
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text('Logout'),
      color: Colors.pink[800],
      onPressed: () => {},
      textColor: Colors.white,
    ),
  );
}
