import 'package:flutter/material.dart';
import 'package:itesogram/utils/colors.dart';
import 'package:line_icons/line_icons.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share with the world!'),
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'POST',
                style: TextStyle(
                    color: itesoColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))
        ],
      ),
      body: Center(
        child: IconButton(
          icon: Icon(LineIcons.upload),
          onPressed: () {},
        ),
      ),
    );
  }
}
