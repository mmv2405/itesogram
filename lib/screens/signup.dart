import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itesogram/logic/auth_methods.dart';
import 'package:itesogram/screens/home.dart';
import 'package:itesogram/screens/login.dart';
import 'package:itesogram/utils/colors.dart';
import 'package:itesogram/utils/utils.dart';
import 'package:itesogram/utils/widgets/text_field.dart';

import '../responsive/layout_screen.dart';
import '../responsive/web_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _globalImage;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _globalImage = image;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String errorMessage = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _globalImage!,
    );

    setState(() {
      _isLoading = false;
    });

    if (errorMessage != 'success') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResponsiveLayout(
            webScreenLayout: WebScreen(),
            mobileScreenLayout: Posts(),
          ),
        ),
      );
    } else {
      showSnackBar(errorMessage, context);
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: itesoColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64,
                ),
                Stack(
                  children: [
                    _globalImage != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(
                              _globalImage!,
                            ),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://www.nicepng.com/png/detail/73-730154_open-default-profile-picture-png.png'),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 90,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo),
                        ))
                  ],
                ),
                SizedBox(height: 40),
                TextFieldInput(
                  hintText: 'Enter your Username',
                  textEditingController: _usernameController,
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your email',
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your password',
                  textEditingController: _passwordController,
                  textInputType: TextInputType.visiblePassword,
                  password: true,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Tell us about yourself',
                  textEditingController: _bioController,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10),
                SizedBox(height: 35),
                InkWell(
                  child: GestureDetector(
                    onTap: signUpUser,
                    child: Container(
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Sign Up',
                              style: TextStyle(color: itesoColor),
                            ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: navigateToLogin,
                  child: Container(
                    child: Text(
                      'Go back to Login',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
