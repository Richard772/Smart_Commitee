import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/Flutter_Fire/Authentication.dart';
import 'package:event_planner/Models/userSetup.dart';
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

final _isSubmitted = true;
TextEditingController _emailInput = TextEditingController();
TextEditingController _passwordInput = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();
TextEditingController _userName = TextEditingController();

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final logo = SizedBox(
      child: Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 17.6),
          child: Center(
            child: Text(
              "Sign Up!",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black.withBlue(500),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.32,
    );

    final userNameField = Padding(
      padding: EdgeInsets.only(
        bottom: 25,
      ),
      child: TextFormField(
        enabled: _isSubmitted,
        controller: _userName,
        autofocus: true,
        autocorrect: true,
        decoration: InputDecoration(
            labelText: "username",
            hintStyle: TextStyle(
              color: Colors.black38,
            ),
            hintText: "someone",
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.4),
              borderSide: BorderSide(color: Colors.white38, width: 13),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always),
        keyboardType: TextInputType.emailAddress,
      ),
    );

    final emailField = TextFormField(
      enabled: _isSubmitted,
      controller: _emailInput,
      autocorrect: true,
      autofocus: true,
      decoration: InputDecoration(
          hintText: "someone@email.com",
          hintStyle: TextStyle(
            color: Colors.black38,
          ),
          labelText: "email",
          labelStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.4),
            borderSide: BorderSide(color: Colors.white38, width: 13),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always),
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
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  labelText: "password",
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.4),
                    borderSide: BorderSide(color: Colors.white38, width: 13),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              enabled: _isSubmitted,
              controller: _confirmPassword,
              autocorrect: true,
              autofocus: true,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.4),
                    borderSide: BorderSide(color: Colors.white38, width: 13),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
          ),
        ],
      ),
    );

    final fields = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        userNameField,
        emailField,
        passwordField,
      ],
    );

    final registerButton = Material(
      color: Colors.black.withBlue(600),
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
            Register(_emailInput.text, _passwordInput.text, _userName.text);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        registerButton,
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already having an account?"),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                logo,
                fields,
                bottom,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
