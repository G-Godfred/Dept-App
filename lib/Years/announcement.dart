import 'package:Practice/constants.dart';
import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final announ = Provider.of<QuerySnapshot>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextField(
            decoration:
                textInputDecoration.copyWith(hintText: 'Announcement(s)'),
          ),
          SizedBox(height: 5),
          RaisedButton(
              onPressed: null, child: Text('Post'), color: Colors.lightBlue)
        ],
      ),
    );
  }
}
