import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/model/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

//collection reference


//adding to db
final CollectionReference userCollection = Firestore.instance.collection('users');

Future updateUserData(String username,String email, String password) async{
return await userCollection.document(uid).setData({
  'username' : username,
  'email': email,
  'password': password,
});
}

// List<Profile> _userListFromSnapshot(QuerySnapshot snapshot){
//   return snapshot.documents.map((doc){
// return Profile(
//   username: doc.data['username'] ?? '',
//   email: doc.data['email'] ?? '',
//   password: doc.data['password'] ?? ''
// );
//   }).toList();
// }

// Stream<List<Profile>> get users {
//   return userCollection.snapshots().map(_userListFromSnapshot);
// }
//final firestore = FirebaseFirestore.instance;   //

}