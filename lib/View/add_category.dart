import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/Controller/CategoryProvider.dart';
import 'package:provider/provider.dart';

class AddNewCategory extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, pr, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add Category"),
          backgroundColor: Color(0xFF0059B3),
          actions: [],
        ),
        backgroundColor: Color.fromRGBO(247, 247, 247, 10),
        body: ListView(
          children: [
            Container(
              width: 328,
              height: 68,
              margin: EdgeInsets.only(top: 24, left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Category Name',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0059B3),
                    minimumSize: Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text('Add Category'),
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      pr.addCategory(nameController.text);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
