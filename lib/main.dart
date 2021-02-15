import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'wrapper.dart';
import 'package:flutter_project/services/auth.dart';
import 'model/user.dart';

String username;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
