import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../models/Category.dart';
import '../models/Task.dart';
import 'items/item_category.dart';
import 'items/item_task.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Color(0xFF0059B3),
          actions: [],
        ),
        backgroundColor: Color.fromRGBO(247, 247, 247, 10),
        body: ListView(
          children: [
//****************************** 3 cards sction ****************************** ****************************** */

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.only(top: 16, right: 4, left: 16),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'To Do',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '3',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 160,
                    margin: EdgeInsets.only(top: 16, right: 4, left: 4),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'In Progress',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '9',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.only(top: 16, right: 16, left: 4),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '20',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
//****************************** Recent Tasks sction ****************************** ****************************** */
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 24, right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Tasks",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // handle click event
                        },
                        child: Text(
                          "Show all",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),

            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          TaskItem(Data.tasks[1]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TaskItem(Data.tasks[2]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TaskItem(Data.tasks[2]),
                        ],
                      )),
                ),
              ],
            ),

//****************************** category sction ****************************** ****************************** */
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 24, right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // handle click event
                        },
                        child: Text(
                          "Show all",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),

            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          CategoryItem(Data.categories[1]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CategoryItem(Data.categories[2]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CategoryItem(Data.categories[3]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CategoryItem(Data.categories[4]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CategoryItem(Data.categories[2]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          CategoryItem(Data.categories[2]),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}

//********************************* for testing
