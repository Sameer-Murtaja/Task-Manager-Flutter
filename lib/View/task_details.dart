import 'package:flutter/material.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:provider/provider.dart';

import '../Controller/CategoryProvider.dart';
import '../Controller/TaskProvider.dart';
import 'edit_task.dart';

class TaskDetails extends StatefulWidget {
  int taskId;
  TaskDetails(this.taskId);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  void initState() {
    // TODO: implement initState
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
    return Consumer2<TaskProvider, CategoryProvider>(
        builder: (context, taskPr, categoryPr, x) {
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
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskPr.currentTask?.title??"",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                Text(taskPr.currentTask?.description??""),
                SizedBox(
                  height: 20,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Category: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(categoryPr
                      .getCategoryName(taskPr.currentTask?.categoryId ?? -1)),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("State: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(taskPr.currentTask?.state?.name ?? ""),
                  ],
                )
              ],
            ),
          ));
    });
  }
}
