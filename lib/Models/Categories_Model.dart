// ignore: camel_case_types
import 'package:flutter/foundation.dart';

class Categories_Model{
  String categoryName;
  String images;

  Categories_Model(this.categoryName, this.images);

  static List<Categories_Model> getCategories()=> [
    Categories_Model("Wedding", "assets/wedding1.jpg"),
    Categories_Model("BirthDay Party", "assets/Birthday"),
    Categories_Model("Business Meetings", "assets/OIP (1).jpg"),
    Categories_Model("conference Meetings", "assets/Conference.jpg"),
    Categories_Model("Beach Party", "assets/download (1).jpg"),
    Categories_Model("Funeral Ceremony", "assets/OIP.jpg"),

  ];
}