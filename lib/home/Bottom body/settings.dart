import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(100, 10, 0, 0)),
        Text(
          'Personal',
          style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 7),
        ListView(children: <Widget>[
          ListTile(
            title: Text(
              'Edit Name',
              style: TextStyle(fontSize: 15, color: Colors.lightBlue),
            ),
          ),
          SizedBox(height: 7),
          ListTile(
            title: Text(
              'Edit Year',
              style: TextStyle(fontSize: 15, color: Colors.lightBlue),
            ),
          ),
          SizedBox(height: 7),
          ListTile(
            title: Text(
              'Contact',
              style: TextStyle(fontSize: 15, color: Colors.lightBlue),
            ),
          ),
          SizedBox(height: 7),
        ]),
      ],
    );
  }
}
