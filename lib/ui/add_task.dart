import 'package:flutter/material.dart';
import 'package:flutter_final/data/dbController.dart';
import 'package:flutter_final/data/sample_data.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        backgroundColor: Color(0xFF0059B3),
        actions: [],
      ),
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      body: Consumer<DbController>(builder: (context,pr,child){
        return ListView(
        children: [
          Container(
            width: 328,
            height: 56,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Title',
              ),
            ),
          ),
          Container(
            width: 328,
            height: 224,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Description',
              ),
              maxLines: 5,
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
                child: Text('Add Task'),
                onPressed: () {
                  if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty){
                    pr.addTask(titleController.text, descriptionController.text);
                     Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ),
        ],
      );
      })
      
      
      



    );
  }
}
