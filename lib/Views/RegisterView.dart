import 'package:event_planner/Flutter_Fire/Authentication.dart';
import 'package:event_planner/Models/userSetup.dart';
import 'package:event_planner/Views/Categories.dart';
import 'package:event_planner/Views/Home.dart';
import 'package:event_planner/Views/LoginView.dart';
import 'package:event_planner/Views/OpeningView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

final _formKey1 = GlobalKey<FormState>();
final _isSubmitted = true;
TextEditingController _emailInput = TextEditingController();
TextEditingController _passwordInput = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();
TextEditingController _userName = TextEditingController();

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
      child: Image.asset(
        "assets/artistic-ribbon-forming-tornado-shape-5601ld.png",
        fit: BoxFit.cover,
      ),
    );

    final userNameField = Padding(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        enabled: _isSubmitted,
        controller: _userName,
        autocorrect: true,
        autofocus: true,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "username",
          hintText: "someone",
          hintStyle: TextStyle(
            color: Colors.black38,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );

    final emailField = TextFormField(
      enabled: _isSubmitted,
      controller: _emailInput,
      autocorrect: true,
      autofocus: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "someone@email.com",
        labelText: "email",
        hintStyle: TextStyle(
          color: Colors.black38,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );

    final passwordField = Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              enabled: _isSubmitted,
              controller: _passwordInput,
              autocorrect: true,
              autofocus: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "password",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              enabled: _isSubmitted,
              controller: _confirmPassword,
              autocorrect: true,
              autofocus: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );

    final fields = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        userNameField,
        emailField,
        passwordField,
      ],
    );

    final registerButton = Material(
      color: Colors.blue[700],
      elevation: 4.5,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: MaterialButton(
        child: Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () async {
          try {
            if (_passwordInput.text == _confirmPassword.text &&
                _userName.text.isNotEmpty) {
              UserCredential user = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _emailInput.text, password: _passwordInput.text);

              FirebaseAuth.instance.currentUser
                  .updateProfile(displayName: _userName.text);
              userSetup(_userName.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            } else {
              //TODO: Error alertDialog ,
              print("passwords didi not match");
            }
          } catch (e) {
            print(e);
            _userName.clear();
            _emailInput.clear();
            _passwordInput.clear();
            _confirmPassword.clear();

          } on FirebaseAuthException catch (e) {
            if (e.code == "weak-password") {
              print("Your password is weak");
            } else if (e.code == "email-already-in-use") {
              print("this email already in use");
            }
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        registerButton,
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Already having an account?"),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Text("Sign In"),
              ),
            ],
          ),
        )
      ],
    );

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              logo,
              fields,
              bottom,
            ],
          ),
        ),
      ),
    ));
  }
}
