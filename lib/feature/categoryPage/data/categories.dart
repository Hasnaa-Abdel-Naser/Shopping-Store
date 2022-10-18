import 'package:flutter/material.dart';
class Categories{
  List<Map<String , dynamic>> dataOfCategory = [
    {
      'name' : "Electronics",
      'backColor' : Color(0xffD2DAFF),
      'image' : 'assets/gadgets.png',
      'coll' : 'electronic'
    },
    {
      'name' : "Fashion",
      'backColor' : Color(0xffffdbed),
      'image' : 'assets/brand.png',
      'coll' : 'fashion'
    },
    {
      'name' : "Books",
      'backColor' : Color(0xffffebd2),
      'image' : 'assets/books.png',
      'coll': 'books'
    },
    {
      'name' : "Home Furniture",
      'backColor' : Color(0x95dbcaa9),
      'image' : 'assets/furniture.png',
      'coll': 'furniture'
    },
  ];
}