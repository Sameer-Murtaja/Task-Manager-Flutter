import 'package:flutter_final/models/Category.dart';

class Task {
  int? id;
  String? title;
  String? description;
  int? categoryId;
  TaskState? state;

  Task(
      {this.id,
      required this.title,
      required this.description,
      this.categoryId,
      this.state = TaskState.TODO});

  Task.fromMap(Map map) {
    id = map['id'];
    this.title = map['title'];
    description = map['description'];
    categoryId = map['categoryId'];
    state = map['state'] == "TODO"
        ? TaskState.TODO
        : map['state'] == "IN_PROGRESS"
            ? TaskState.IN_PROGRESS
            : map['state'] == "DONE"
                ? TaskState.DONE
                : null;
  }

  toMap() {
    return {
      "title": title,
      "description": description,
      "categoryId": categoryId,
      "state": state!.name
    };
  }
}

enum TaskState { TODO, IN_PROGRESS, DONE }
