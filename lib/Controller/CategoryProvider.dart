import 'package:flutter/material.dart';

import '../models/Category.dart';
import '../models/dbHelper.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    getAllCategories();
  }

  List<Category> categories = [];
  bool isLoading = false;

  void flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getAllCategories() async {
    flipIsLoading();
    categories = await DbHelper.dbHelper.getAllCategories();
    flipIsLoading();
  }

  Future<void> addCategory(String name) async {
    Category category = Category(
      name: name,
    );
    await DbHelper.dbHelper.addCategory(category);
    getAllCategories();
  }

  Future<void> updateCategory(Category category) async {
    await DbHelper.dbHelper.updateCategory(category);
    int categoryIndex = categories.indexWhere((c) => c.id == category.id);
    if (categoryIndex != -1) {
      categories[categoryIndex] = category;
    }
    notifyListeners();
  }

  Future<void> deleteCategory(int id) async {
    await DbHelper.dbHelper.deleteCategory(id);
    categories.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  String getCategoryName(int id) {
    String name;
    try {
      name = categories.firstWhere((element) => element.id == id).name ?? "null name";
    } catch (e) {
      name =  "none";
    }
    return name;
  }
}
