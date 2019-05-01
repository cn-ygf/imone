import 'package:flutter/material.dart';

class CloudPage extends StatefulWidget {
  CloudPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CloudPageState createState() => _CloudPageState();
}

class _CloudPageState extends State<CloudPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('动态'),
      ),
    );
  }
}
