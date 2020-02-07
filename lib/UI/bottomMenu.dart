import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  int selectedIndex;
  BottomMenu(this.selectedIndex);
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  //int _selectedIndex = 0;
  void _onItemTapped(int index) {
    switch(index){
      case 0:{
        Navigator.pushNamed(context, '/home');
      }
      break;
      case 1:{
        //Navigator.pushNamed(context, '/home');
      }
      break;
      case 2:{
        Navigator.pushNamed(context, '/products');
      }
      break;
      case 3:{
        //Navigator.pushNamed(context, '/home');
      }
      break;
      case 4:{
        //Navigator.pushNamed(context, '/home');
      }
      break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text('Categories'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more),
          title: Text('More'),
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor:  Color(0xff0dbea8),
      unselectedItemColor:Color(0xff515C6F),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
