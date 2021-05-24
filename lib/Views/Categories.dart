import 'package:event_planner/Models/Categories_Model.dart';
import 'package:event_planner/Models/Drawer_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

final List<Categories_Model> _categoryList = Categories_Model.getCategories();
TextEditingController _searchInput = TextEditingController();

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final categoryText = Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        "Categories",
        style: TextStyle(fontSize: 20, color: Colors.black54),
      ),
    );

    final searchInput = Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.53,
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: _searchInput,
        autofocus: true,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: "search",
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 18,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ),
    );

    final searchButton = IconButton(
      icon: Icon(
        Icons.search,
        size: 30,
        color: Colors.black38,
      ),
      onPressed: () {
        print("Search button pressed");
      },
    );

    final searchRow = Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.teal),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            categoryText,
            searchInput,
            searchButton,
          ],
        ),
      ),
    );

    final categoryList = Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3
          ),
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 15,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.42,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(_categoryList[index].categoryName)
                  ],
                ),
              ),
            );
          }),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        centerTitle: true,
        backgroundColor: Colors.teal[800],
        elevation: 0,
        actions: [
          IconButton(
            autofocus: true,
            icon: Icon(
              Icons.add_alert,
              size: 30,
            ),
            onPressed: () {
              print("Icon Pressed");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerModel(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          searchRow,
          //TODO: controlPanel,
          //TODO: categoriesList
          //TODO: bottomNavigationBar,
        ],
      ),
    );
  }
}
