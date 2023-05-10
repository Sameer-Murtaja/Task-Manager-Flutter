import 'package:flutter/material.dart';
import 'package:flutter_final/models/Task.dart';

import 'edit_task.dart';

class TaskDetails extends StatefulWidget{
  Task task;
  TaskDetails(this.task);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  refresh(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        actions: [
          IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: ( (context) => EditTask(widget.task)))).then((value) => refresh());}, icon: Icon(Icons.edit))
        ],),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(widget.task.title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 15,),
          Text(widget.task.description),
        SizedBox(height: 20,),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Category: ",style: TextStyle(fontWeight: FontWeight.bold)),
            Text(widget.task.category?.name?? "none"),
            ]
        ),
        SizedBox(height: 20,),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("State: ",style: TextStyle(fontWeight: FontWeight.bold)),
            Text(widget.task.state!.name),
          ],)
        ],),
      ),
    );
  }
}