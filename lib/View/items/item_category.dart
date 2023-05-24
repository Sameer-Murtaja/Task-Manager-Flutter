import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/View/all_tasks.dart';

import '../../models/Category.dart';



class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name??"", style: TextStyle(fontSize: 18)),
      trailing: Icon(Icons.arrow_forward_ios),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Colors.white,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AllTasks(category: category,)));
      },
    );
  }
}