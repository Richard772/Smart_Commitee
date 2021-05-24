import 'package:event_planner/Flutter_Fire/Authentication.dart';
import 'package:event_planner/Views/Categories.dart';
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

final _isSubmitted = true;
final _formKey = GlobalKey<FormState>();
TextEditingController _emailInput = new TextEditingController();
TextEditingController _passwordInput = new TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Image.asset(
        "assets/artistic-ribbon-forming-tornado-shape-5601ld.png",
        fit: BoxFit.cover,
      ),
    );

    final emailField = TextFormField(
      enabled: _isSubmitted,
      controller: _emailInput,
      autocorrect: true,
      autofocus: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "someone@email.com",
          labelText: "email",
          hintStyle: TextStyle(
            color: Colors.black,
          )),
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
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "*********",
                labelText: "password",
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
            obscureText: true,
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
    );

    final fields = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        emailField,
        passwordField,
      ],
    );

    final loginButton = Material(
      color: Colors.blue[700],
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
        onPressed: () async {
          try{await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _emailInput.text, password: _passwordInput.text);
          var user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }
          }catch (e){
            print(e);
            _emailInput.clear();
            _passwordInput.clear();
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        loginButton,
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Don't have an account yet?"),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                child: Text("Sign Up!"),
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
            key: _formKey,
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
    );
  }
}
