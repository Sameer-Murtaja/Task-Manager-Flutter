import 'package:flutter/material.dart';
import 'package:flutter_final/View/add_category.dart';
import 'package:flutter_final/View/items/item_category.dart';
import 'package:provider/provider.dart';

import '../Controller/CategoryProvider.dart';
import '../Controller/sample_data.dart';

class AllCategories extends StatefulWidget {
  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, categoryPr, x) {
      return Scaffold(
        appBar: AppBar(title: Text("Categories")),
        backgroundColor: Color.fromRGBO(247, 247, 247, 10),
        body: categoryPr.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : categoryPr.categories.isEmpty
                ? Center(child: Text("no categories"))
                : ListView(
                    children: categoryPr.categories
                        .map((e) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: CategoryItem(e)))
                        .toList()),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFF0059B3),
            foregroundColor: Colors.white,
            child: Icon(Icons.add_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewCategory()),
              );
            }),
      );
    });
  }
}
