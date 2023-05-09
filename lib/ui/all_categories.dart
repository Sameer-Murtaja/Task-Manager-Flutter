import 'package:flutter/material.dart';
import 'package:flutter_final/ui/items/item_category.dart';

import '../data/sample_data.dart';

class AllCategories extends StatefulWidget {
  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      body: ListView(children: Data.categories.map((e) => Container(margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: CategoryItem(e))).toList()),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF0059B3),
          foregroundColor: Colors.white,
          child: Icon(Icons.add_outlined),
          onPressed: () {}),
    );
  }
}
