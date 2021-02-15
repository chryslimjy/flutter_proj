import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_project/App.dart';
import 'Login.dart';
import 'Homepage.dart';
import 'model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either app or authenticate widget
    if (user == null) {
      return Login();
    } else {
      return Homepage();
    }
  }
}
