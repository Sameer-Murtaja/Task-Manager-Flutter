import 'package:flutter/material.dart';
import 'package:flutter_final/Controller/sample_data.dart';
import 'package:flutter_final/models/Category.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:flutter_final/View/all_tasks.dart';
import 'package:provider/provider.dart';

import '../Controller/CategoryProvider.dart';
import '../Controller/TaskProvider.dart';

class EditTask extends StatefulWidget {
  int taskId;
  EditTask(this.taskId);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

  
  @override
  void initState() {
    super.initState();

    Task task = Provider.of<TaskProvider>(context, listen: false)
        .tasks
        .where((e) => e.id == widget.taskId)
        .first;

        Provider.of<TaskProvider>(context, listen: false)
        .setCurrentTask(task);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Task"),
        ),
        backgroundColor: Color.fromRGBO(247, 247, 247, 10),
        body: Consumer2<TaskProvider,CategoryProvider>(builder: (context, taskPr,categoryPr, x) {
      return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 328,
                  height: 128,
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
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text("Category: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 28,
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
                                 taskPr.changeCurrentTaskCategory(e.id??-1);
                                  
                                }),
                            Text(e.name??""),
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
                  )
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("State: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...TaskState.values.map(
                          (e) => Row(
                            children: [
                              Radio(
                                  value: e,
                                  groupValue: taskPr.currentTask?.state,
                                  onChanged: (newValue) {
                                    taskPr.changeCurrentTaskState(e);
                                    setState(() {});
                                  }),
                              Text(e.name),
                            ],
                          ),
                        )
                      ],
                    )
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
                      child: Text(
                        'Edit Task',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Task task = Task(
                            id: widget.taskId,
                            title: taskPr.titleController.text,
                            description: taskPr.descriptionController.text,
                            categoryId: taskPr.currentTask?.categoryId,
                            state: taskPr.currentTask?.state);
                        taskPr.updateTask(task);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 0, 0),
                        minimumSize: Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Detele Task',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        taskPr.deleteTask(widget.taskId);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
