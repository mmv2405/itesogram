import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:itesogram/screens/Nav%20Screens/profile_screen.dart';
import 'package:line_icons/line_icons.dart';

import '../../screens/Nav Screens/home_screen.dart';
import '../../screens/Nav Screens/post_screen.dart';
import '../../screens/Nav Screens/search_screen.dart';

class BottomNavigationBarIteso extends StatefulWidget {
  //INDEX ON WHERE TO START APP
  int selectedIndex;
  BottomNavigationBarIteso({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<BottomNavigationBarIteso> createState() =>
      _BottomNavigationBarItesoState();
}

class _BottomNavigationBarItesoState extends State<BottomNavigationBarIteso> {
//TEXT AREA ON BOTTOM NAVIGATION BAR
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Post',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Posts()),
                  );
                },
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
              ),
              GButton(
                icon: LineIcons.plusCircle,
                text: 'Post',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PantallaPost()),
                  );
                },
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ],
            selectedIndex: widget.selectedIndex,
            onTabChange: (index) {
              setState(() {
                widget.selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
