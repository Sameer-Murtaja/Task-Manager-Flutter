import 'package:flutter/material.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:provider/provider.dart';

import '../data/dbController.dart';
import 'edit_task.dart';

class TaskDetails extends StatefulWidget {
  int taskId;
  late Task currentTask;
  TaskDetails(this.taskId);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  @override
  Widget build(BuildContext context) {
    try{

    widget.currentTask = Provider.of<DbController>(context).tasks.where((e) => e.id == widget.taskId).first;
    }catch(e){
      widget.currentTask = Task(title: "title", description: "description");
    }
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Task Details"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => EditTask(widget.taskId))));
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Consumer<DbController>(builder: (context, pr, x) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.currentTask.title!,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                Text(widget.currentTask.description!),
                SizedBox(
                  height: 20,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Category: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.currentTask.categoryId.toString()),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("State: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.currentTask.state?.name?? ""),
                  ],
                )
              ],
            ),
          );
        }));
  }
}
