import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('联系人'),
      ),
    );
  }
}
