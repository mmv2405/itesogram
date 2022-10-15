import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:itesogram/screens/likes.dart';
import 'package:itesogram/screens/profile.dart';
import 'package:itesogram/utils/colors.dart';
import 'package:line_icons/line_icons.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: itesoColor,
      appBar: AppBar(
        leading: Icon(LineIcons.camera),
        backgroundColor: itesoColor,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(LineIcons.envelope),
          ),
        ],
        title: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      body: Column(
        children: [
          horizontalList,
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset('assets/images/icon.png'),
                        title: const Text('Username'),
                        subtitle: Text(
                          'Secondary Text',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.asset('assets/images/image_post.jpg'),
                      ButtonBar(
                        buttonPadding: EdgeInsets.all(1),
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.heart),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.comment),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.share),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset('assets/images/icon.png'),
                        title: const Text('Username'),
                        subtitle: Text(
                          'Secondary Text',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.asset('assets/images/image_post.jpg'),
                      ButtonBar(
                        buttonPadding: EdgeInsets.all(1),
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.heart),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.comment),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.share),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset('assets/images/icon.png'),
                        title: const Text('Username'),
                        subtitle: Text(
                          'Secondary Text',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.asset('assets/images/image_post.jpg'),
                      ButtonBar(
                        buttonPadding: EdgeInsets.all(1),
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.heart),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.comment),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.share),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset('assets/images/icon.png'),
                        title: const Text('Username'),
                        subtitle: Text(
                          'Secondary Text',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Image.asset('assets/images/image_post.jpg'),
                      ButtonBar(
                        buttonPadding: EdgeInsets.all(1),
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.heart),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.comment),
                          ),
                          TextButton(
                            onPressed: () {
                              // Perform some action
                            },
                            child: Icon(LineIcons.share),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }

  Container BottomNavigationBar() {
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
              ),
              GButton(
                icon: LineIcons.heart,
                text: 'Likes',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Likes()),
                  );
                },
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
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
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

Widget horizontalList = Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 80.0,
    child: new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 70.0,
          margin: EdgeInsets.all(5),
          child: Icon(LineIcons.plus),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 80.0,
          margin: EdgeInsets.all(5),
        ),
      ],
    ));
