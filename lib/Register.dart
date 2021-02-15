import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project/Homepage.dart';

import 'Login.dart';
import 'package:flutter_project/services/auth.dart';

TextEditingController emailRegController = new TextEditingController();
TextEditingController passwordRegController = new TextEditingController();
TextEditingController cfmpassRegController = new TextEditingController();

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                   Container(
                   // child:Text("Register")
                    width: 1000,
                height: 100,
                    child: Image(image: AssetImage("img/logo.png")),
                ),
                 Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter a username' : null,
                    onChanged: (val) {
                      setState(() => username = val);
                    },
                   
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
             
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    controller: emailRegController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (val) =>
                        val.length < 6 ? 'Enter a pasword 6 chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    obscureText: true,
                    controller: passwordRegController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: cfmpassRegController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                RaisedButton(
                  child: Text('Sign up'),
                  onPressed: () async {
                    if (passwordRegController.text != cfmpassRegController.text) {
                      setState(() => error = 'password does not match');
                    } else {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.registerWithEmailAndPassword(
                           username, email, password);
                        if (result == null) {
                          setState(() => error = 'please supply a valid email');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                      }
                    }

                    // Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),);
                  },
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: FlatButton(
                      child: Text(
                        'Have an account? Log in now',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }),
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
