import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('asdasd'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Push'),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                ),
              },
            ),
            RaisedButton(
              child: Text('PushReplacement'),
              onPressed: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Volvé Oscar con Pop'),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          RaisedButton(
            child: Text('Volvé Oscar con Push Replacement'),
            onPressed: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstScreen(),
                ),
              ),
            },
          )
        ],
      ),
    );
  }
}
