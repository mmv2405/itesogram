import 'package:flutter/material.dart';
import 'package:itesogram/models/user.dart' as model;
import 'package:itesogram/provider/user_provider.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(child: Text(user.username)),
    );
  }
}
