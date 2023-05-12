import 'package:flutter_final/models/Category.dart';





class Task {
  String title;
  String description;
  Category? category;
  TaskState state;

  Task(this.title, this.description, {this.category, this.state = TaskState.TODO});

}

  enum TaskState{
    TODO,
    IN_PROGRESS,
    DONE
  }

