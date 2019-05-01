import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  MePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('我的'),
      ),
    );
  }
}
