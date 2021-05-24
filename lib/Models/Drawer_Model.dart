import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerModel extends StatelessWidget {
  final List<String> categories = [
    "About Us",
    "Settings",
    "Contacts",
    "Tech & Support"
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.5),
              child: InkWell(
                child: Card(
                  elevation: 3.4,
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(categories[index].characters.first),
                    ),
                    title: Text(categories[index]),
                  ),
                ),
                onTap: () {
                  debugPrint("Category pressed");
                },
              ),
            );
          },
        ),
      );
  }
}
