import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/Controller/CategoryProvider.dart';
import 'package:flutter_final/View/all_categories.dart';
import 'package:flutter_final/View/all_tasks.dart';
import 'package:provider/provider.dart';

import '../Controller/TaskProvider.dart';
import '../Controller/sample_data.dart';
import '../models/Category.dart';
import '../models/Task.dart';
import 'items/item_category.dart';
import 'items/item_task.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<TaskProvider, CategoryProvider>(
        builder: (context, taskPr, categoryPr, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Color(0xFF0059B3),
          actions: [],
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 24, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Resent Tasks",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllTasks(
                                        //state: TaskState.TODO,
                                      )),
                            );
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
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: taskPr.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : taskPr.tasks.isEmpty
                              ? Center(child: Text("no tasks"))
                              : Column(
                                  children: [
                                    ...taskPr.tasks
                                        .take(3)
                                        .toList()
                                        .map((e) => Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: TaskItem(e),
                                            )),
                                  ],
                                )),
                ),
              ],
            ),

            //****************************** category sction ****************************** ****************************** */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCategories()),
                            );
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
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: categoryPr.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : categoryPr.categories.isEmpty
                              ? Center(child: Text("no categories"))
                              : Column(
                                  children: [
                                    ...categoryPr.categories
                                        .take(3)
                                        .toList()
                                        .map((e) => Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: CategoryItem(e),
                                            )),
                                  ],
                                )),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
