
import '../models/Category.dart';
import '../models/Task.dart';

class Data {
  static List<Task> tasks = [
    Task("Test",
        "Task description Task description Task description Task description Task description Task description Task description",
        category: categories[0]),
    Task("Test2",
        "Task description Task description Task description Task description Task description Task description Task description",
        category: categories[1]),
    Task("Test3",
        "Task description Task description Task description Task description Task description Task description Task description"),
    Task("Test4",
        "Task description Task description Task description Task description Task description Task description Task description"),
    Task("Test5",
        "Task description Task description Task description Task description Task description Task description Task description"),
  ];

  static List<Category> categories = [
    Category("Category"),
    Category("Category1"),
    Category("Category2"),
    Category("Category3"),
    Category("Categor74"),
  ];
}
