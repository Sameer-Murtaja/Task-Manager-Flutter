import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  String taskState = "To do";
  String category = "none";
  @override
  Widget build(BuildContext context) {
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
              child: const TextField(
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
              child: const TextField(
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
                  Row(
                    children: [
                      Radio(
                          value: "none",
                          groupValue: category,
                          onChanged: (newValue) {
                            category = "none";
                            setState(() {});
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
                    Row(
                      children: [
                        Radio(
                            value: "To do",
                            groupValue: taskState,
                            onChanged: (newValue) {
                              taskState = "To do";
                              setState(() {});
                            }),
                        Text("To do"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "In progress",
                            groupValue: taskState,
                            onChanged: (newValue) {
                              taskState = "In progress";
                              setState(() {});
                            }),
                        Text("In progress"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Done",
                            groupValue: taskState,
                            onChanged: (newValue) {
                              taskState = "Done";
                              setState(() {});
                            }),
                        Text("Done"),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
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
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
