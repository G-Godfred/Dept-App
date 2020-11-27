import 'package:Practice/Authenticate/Auth.dart';
import 'package:Practice/constants.dart';
import 'package:Practice/home/Sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignIn(),
                      ));
                },
                icon: Icon(Icons.arrow_forward),
                label: Text('Sign in')),
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 15),
              TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Username'),
                  validator: (val) => val.isEmpty ? 'Username' : null,
                  onChanged: (val) {
                    setState(() => username = val);
                  }),
              SizedBox(height: 15),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter Email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 15),
              TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter 6+' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 15),
              RaisedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await _auth.signUp(email, password);
                    
                  }
                },

                //child: Container(
                //width: 15,
              )
            ]),
          ),
        ));
  }
}
