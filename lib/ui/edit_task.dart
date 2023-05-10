import 'package:flutter/material.dart';
import 'package:flutter_final/data/sample_data.dart';
import 'package:flutter_final/models/Category.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:flutter_final/ui/all_tasks.dart';

class EditTask extends StatefulWidget {
  Task task;
  late Task currentTask;
  EditTask(this.task);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  Category? category;
  late TaskState taskState;
  @override
  void initState() {
    super.initState();
    widget.currentTask = Task(widget.task.title, widget.task.description,
        category: widget.task.category, state: widget.task.state);
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.currentTask.title;
    descriptionController.text = widget.currentTask.description;
    category = widget.currentTask.category;
    taskState = widget.currentTask.state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
      ),
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      body: Padding(
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
                controller: titleController,
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
                controller: descriptionController,
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
              Text("Category: ", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                width: 28,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...Data.categories.map(
                    (e) => Row(
                      children: [
                        Radio(
                            value: e,
                            groupValue: category,
                            onChanged: (newValue) {
                              widget.currentTask.category = e;
                              setState(() {
                                widget.currentTask.title = titleController.text;
                                widget.currentTask.description =
                                    descriptionController.text;
                              });
                            }),
                        Text(e.name),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: null,
                          groupValue: category,
                          onChanged: (newValue) {
                            widget.currentTask.category = null;
                            setState(() {
                              widget.currentTask.title = titleController.text;
                              widget.currentTask.description =
                                  descriptionController.text;
                            });
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
                Text("State: ", style: TextStyle(fontWeight: FontWeight.bold)),
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
                              groupValue: taskState,
                              onChanged: (newValue) {
                                widget.currentTask.state = e;
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
                    widget.task.title = titleController.text;
                    widget.task.description = descriptionController.text;
                    widget.task.category = widget.currentTask.category;
                    widget.task.state = widget.currentTask.state;
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
                    Data.tasks.removeWhere((element) => element == widget.task);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
