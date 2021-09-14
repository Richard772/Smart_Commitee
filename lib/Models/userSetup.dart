import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup (String displayName) async{
  await FirebaseFirestore.instance.collection("Users").add({
    "userName" : displayName.toString(),
    "Uid" : FirebaseAuth.instance.currentUser.email.toString()
  });
}