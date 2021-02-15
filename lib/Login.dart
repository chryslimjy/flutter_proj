import 'package:flutter/material.dart';
import 'package:flutter_project/services/auth.dart';

import 'Homepage.dart';
import 'Register.dart';

TextEditingController usernameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
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
                    validator: (val) =>
                        val.isEmpty ? 'Please fill in your email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
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
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Row(children: <Widget>[
                    RaisedButton(
                      child: Text('Login'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await _auth.loginWithEmailAndPassword(
                              email, password);
                          if (result == null) {
                            setState(
                                () => error = 'Sign in fail. Please try again');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Homepage()),
                            );
                          }
                        }

                        // Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),);
                      },
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                          child: Text('Sign in anon'),
                          onPressed: () async {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print('error signing in');
                            } else {
                              print('signed in');
                              print(result);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()),
                              );
                            }
                          }),
                    ),
                  ]),
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: FlatButton(
                      child: Text(
                        'Dont have an account? Register Now',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
