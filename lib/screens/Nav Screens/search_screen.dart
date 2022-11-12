import 'package:flutter/material.dart';
import 'package:itesogram/utils/others/colors.dart';
import 'package:itesogram/utils/widgets/bottomNavigationBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: itesoColor,
      bottomNavigationBar:
          BottomNavigationBarIteso(selectedIndex: selectedIndex),
    );
  }
}
