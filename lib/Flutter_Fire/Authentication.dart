import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: non_constant_identifier_names
Future<bool> Register(String email, String password, String userName) async {
  try {
     await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

     return true;
  } catch (e) {
    print(e.toString());
    return false;
  } on FirebaseAuthException catch (e) {
    if (e.code == "Weak-password") {
      print("Weak Password entered");
    } else if (e.code == "Email-already-in-use") {
      print("The email already exists");
      return false;
    }
  }
}

Future<bool> SignIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  } on FirebaseAuthException catch (e) {
    if (e.code == "Weak-password") {
      print("Weak Password entered");
    } else if (e.code == "Email-already-in-use") {
      print("The email already exists");
      return false;
    }
  }
}
