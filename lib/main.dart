import 'package:flutter/material.dart';
import 'package:flutter_final/Controller/sample_data.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:flutter_final/models/dbHelper.dart';
import 'package:flutter_final/View/all_categories.dart';
import 'package:flutter_final/View/all_tasks.dart';
import 'package:flutter_final/View/edit_task.dart';
import 'package:flutter_final/View/home_screen.dart';
import 'package:flutter_final/View/not_found_page.dart';
import 'package:flutter_final/View/tthome_page.dart';
import 'package:flutter_final/util/routes.dart';
import 'package:provider/provider.dart';

import 'Controller/CategoryProvider.dart';
import 'Controller/TaskProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TaskProvider>(
            create: (context) => TaskProvider(),
          ),
          ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              colorScheme: ColorScheme.light(
            primary: Color(0xFF0059B3),
            background: Color.fromRGBO(247, 247, 247, 10),
          )),
          home: ScreenContainer(),
/*
      routes: {
        RoutesName.homePage: (context) => HomeScreen(),
        RoutesName.categoriesPage: (context) => AllCategories(),
        RoutesName.tasksPage: (context) => AllTasks(),
        RoutesName.pageNotFound: (context) => PageNotFound()
      },

        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context){
            return PageNotFound();
        });
  },*/
        ));
  }
}
