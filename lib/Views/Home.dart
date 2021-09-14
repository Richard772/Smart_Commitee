import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/Models/Drawer_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text("Kamati"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: DrawerModel(),
      ),
      body: SafeArea(
        child: FloatingActionButton(
          onPressed: (){

          },
        ),
      ),
    );
  }
}
