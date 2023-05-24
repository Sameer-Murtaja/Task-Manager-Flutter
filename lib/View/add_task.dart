import 'package:flutter/material.dart';
import 'package:flutter_final/Controller/CategoryProvider.dart';
import 'package:flutter_final/Controller/sample_data.dart';
import 'package:flutter_final/Controller/TaskProvider.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:provider/provider.dart';

import '../models/Category.dart';

class AddNewTask extends StatefulWidget {
  TaskState? state;
  Category? category;

  AddNewTask({this.state, this.category});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).setCurrentTask(Task(
        title: "",
        description: "",
        categoryId: widget.category?.id,
        state: widget.state));

        
  // TaskProvider taskPr = Provider.of<TaskProvider>(context, listen: false);
  // Task task = Task(
  //       title: "",
  //       description: "",
  //       categoryId: widget.category?.id,
  //       state: widget.state);

  // taskPr.setCurrentTask(task);
  // taskPr.titleController.text = task.title ?? '';
  // taskPr.descriptionController.text = task.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<TaskProvider, CategoryProvider>(
        builder: (context, taskPr, categoryPr, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Add Task"),
            backgroundColor: Color(0xFF0059B3),
            actions: [],
          ),
          backgroundColor: Color.fromRGBO(247, 247, 247, 10),
          body: ListView(
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
                  controller: taskPr.titleController,
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
                  controller: taskPr.descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Description',
                  ),
                  maxLines: 5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...categoryPr.categories.map(
                    (e) => Row(
                      children: [
                        Radio(
                            value: e.id,
                            groupValue: taskPr.currentTask?.categoryId,
                            onChanged: (newValue) {
                              taskPr.changeCurrentTaskCategory(e.id ?? -1);
                            }),
                        Text(e.name ?? ""),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: null,
                          groupValue: taskPr.currentTask?.categoryId,
                          onChanged: (newValue) {
                            taskPr.changeCurrentTaskCategory(-1);
                          }),
                      Text("none"),
                    ],
                  ),
                ],
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
                      if (taskPr.titleController.text.isNotEmpty &&
                          taskPr.descriptionController.text.isNotEmpty) {
                        taskPr.addTask(taskPr.titleController.text,
                            taskPr.descriptionController.text,
                            category: widget.category, state: widget.state);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
