import 'package:event_planner/Views/LoginView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RegisterView.dart';

class OpeningView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ),
          );
        },
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.only(top: 30),
      child: Material(
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterView(),
              ),
            );
          },
        ),
      ),
    );

    // ignore: non_constant_identifier_names
    final Buttons = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        loginButton,
        registerButton,
      ],
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white38],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            tileMode: TileMode.clamp
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 30, left: 35, right: 35),
          child: Buttons,
        ),
      ),
    );
  }
}
