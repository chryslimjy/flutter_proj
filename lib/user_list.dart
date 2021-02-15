import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'model/profile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
//List<Profile>
    final users = Provider.of<QuerySnapshot>(context);
    print(users.documents);
 //   users.forEach((profile){

   // });
    return Container(
      
    );
  }
}