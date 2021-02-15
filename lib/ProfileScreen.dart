import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'user_list.dart';
import 'model/profile.dart';
import 'Homepage.dart';
import 'package:flutter_project/services/auth.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<QuerySnapshot>.value(
//       value: DatabaseService().getUserData(),
//       child: Container(
//         child: Column(
//           children: <Widget>[
// Container(child: UserList(),)
//         ]),
//       ),
//     );
//   }
// }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = '';
  String error = '';
  String password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  FirebaseUser user;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    if (this.mounted) {
      setState(() {
        // Your state change code goes here
      });
    }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 20.0, left: 50),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                          child: Column(children: <Widget>[
                new Text(
                  "Email:",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                new Text("${user?.email}"),
                Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 8),
                  child: new Text(
                  "Update Email",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    validator: (val) =>
                        val.isEmpty ? 'Enter your password' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'password',
                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                      child: Text('Update'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _authService.updateEmailWithPassword(
                                  "${user?.email}", email, password);
                          if (result == null) {
                            setState(() => error = 'please supply a valid email');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Homepage()),
                            );
                          }
                        }
                      }),
                )
              ]),
            ),
          )),
    );
  }
}
