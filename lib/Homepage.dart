import 'package:flutter/material.dart';

import 'services/auth.dart';


import 'App.dart';
import 'ProfileScreen.dart';
import 'AboutScreen.dart';
import 'Login.dart';
import 'package:flutter_project/services/database.dart';
import 'package:provider/provider.dart';





String username;

void main() {
  //setupLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
     // theme: new ThemeData(scaffoldBackgroundColor: Colors.pinkAccent),
      debugShowCheckedModeBanner: false,
    );
  }
}

// decoration: new BoxDecoration(color: Colors.pinkAccent),




class Homepage extends StatelessWidget {

final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return MaterialApp(
      //backgroundColor: const Color(0xFFF48FB1),
     
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('EzEATS'),
            bottom: TabBar(
              tabs: [
                Text('ORDER'),
                Text('PROFILE'),
                Text('ABOUT'),
              ],
            ),
            actions: <Widget>[
            
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed:()async{
                  await _auth.signOut();
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                },
              )
            ],
          ),
          body: TabBarView(
            children: [
              App(),
              ProfileScreen(),
              AboutScreen(),
            ],
          ),
        ),
      ),
    );
  }
}



