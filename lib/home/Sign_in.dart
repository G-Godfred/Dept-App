import 'package:Practice/constants.dart';
import 'package:Practice/home/home.dart';
import 'package:flutter/material.dart';
import 'package:Practice/Authenticate/Auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
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
                child: Text('Sign In'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    //dynamic result =
                    await _auth.signIn(email, password);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Home()));
                  }
                },
              )
            ]),
          ),
        ));
  }
}
