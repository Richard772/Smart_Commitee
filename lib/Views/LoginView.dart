import 'package:event_planner/Flutter_Fire/Authentication.dart';
import 'package:event_planner/Views/RegisterView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

bool currentValue = false;
final _isSubmitted = true;
//final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _emailInput = new TextEditingController();
TextEditingController _passwordInput = new TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Container(
      height: MediaQuery.of(context).size.height * 0.32,
      child: Center(
        child: Text(
          "Sign In",
          style: TextStyle(
              fontSize: 26,
              color: Colors.black.withBlue(500),
              fontWeight: FontWeight.bold),
        ),
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
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
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
          TextFormField(
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
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.4),
                  borderSide: BorderSide(color: Colors.white38, width: 13),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always),
            obscureText: true,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.blue,
                        value: currentValue,
                        onChanged: (bool newValue) {
                          setState(() {
                            currentValue = newValue;
                          });
                        }),
                    Text("Remember Me"),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final fields = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: emailField,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 15.0),
          child: passwordField,
        ),
      ],
    );

    final loginButton = Material(
      color: Colors.black.withBlue(600),
      elevation: 4.5,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: MaterialButton(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            SignIn(_emailInput.text, _passwordInput.text);
          }),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loginButton,
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account yet?"),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                child: Text(
                  "Sign Up",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  logo,
                  fields,
                  bottom,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
