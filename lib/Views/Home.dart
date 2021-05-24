import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/Models/Drawer_Model.dart';
import 'package:event_planner/Views/Categories.dart';
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
        title: Text("Event planner"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(child: DrawerModel()),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(
            Icons.category_outlined,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Categories(),
            ),
          );
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Events").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, int index) {
              return InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 2, left: 7, right: 7, bottom: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        Card(
                          elevation: 2,
                          color: Colors.white38,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.lightBlue[500],
                              child: Center(
                                child: Text(
                                  snapshot.data.docs[index]["Name"]
                                      .toString()
                                      .characters
                                      .first,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            title: Text(
                              snapshot.data.docs[index]["Name"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.3,
                                  color: Colors.black),
                            ),
                            subtitle: Text("Plan & Relax"),
                            trailing: InkWell(
                              child: Text(
                                "...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.1),
                                topRight: Radius.circular(12.1),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    snapshot.data.docs[index]["Image"]
                                        .toString(),
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          onTap: () {
                            debugPrint("Image selected");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
