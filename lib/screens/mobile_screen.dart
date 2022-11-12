import 'package:flutter/material.dart';
import 'package:itesogram/models/user.dart' as model;
import 'package:itesogram/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'Nav Screens/home_screen.dart';

//THIS SCREENS JUST LOADS DATA BEFORE POSTS IS SHOWN

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  void initState() {
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Posts();
      },
    );
  }
}
