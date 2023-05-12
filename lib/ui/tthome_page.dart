
import 'package:flutter/material.dart';
import 'package:flutter_final/ui/all_categories.dart';
import 'package:flutter_final/ui/all_tasks.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';

class ScreenContainer extends StatefulWidget {
  @override
  _ScreenContainerState createState() => _ScreenContainerState();
}

class _ScreenContainerState extends State<ScreenContainer> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    AllCategories(),
    AllTasks()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xFF0059B3),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GNav(
            onTabChange: _navigateBottomBar,
            gap: 8,
            backgroundColor: Color(0xFF0059B3),
            haptic: true,
            tabBorderRadius: 16,
            color: Colors.white,
            activeColor: Colors.white,
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 600),
            tabBackgroundColor: Color.fromARGB(255, 60, 146, 233),
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(text: 'Home', icon: Icons.home),
              GButton(text: 'Categories', icon: Icons.category),
              GButton(text: 'Tasks', icon: Icons.task),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
    );
  }
}
/*
Widget build(BuildContext context) {
     return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),

        ]),
        appBar:AppBar(title: Text("Home Page"),
        bottom: TabBar(
          tabs: [
          Tab(text: 'Home',),
          Tab(text: 'Categories',),
          Tab(text: 'Tasks',)
        
        ]),
        ),
        body: _pages[_selectedIndex],
        backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      );
    
  }
}

 */