import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({this.index, this.clicked});
  final int index;
  final Function clicked;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color(0xFFEA2149),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(
            FontAwesomeIcons.home,
            size: 20.0,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Sri Lanka'),
          icon: Icon(
            FontAwesomeIcons.flag,
            size: 20.0,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(
            FontAwesomeIcons.searchLocation,
            size: 20.0,
          ),
        ),
      ],
      currentIndex: index,
      onTap: clicked,
      backgroundColor: Colors.black,
    );
  }
}
