
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SecondPage());
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial CompareAAAAAAA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SecondPage1(),
    );
  }
}

class SecondPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Tutorial CompareAAAAA'),
      ),
    );
  }
}


