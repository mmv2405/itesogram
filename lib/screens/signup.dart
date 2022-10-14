import 'package:flutter/material.dart';
import 'package:itesogram/screens/home.dart';
import 'package:itesogram/screens/login.dart';
import 'package:itesogram/utils/colors.dart';
import 'package:itesogram/utils/widgets/text_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
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
                Container(
                  child: Image.asset('assets/images/icon.png'),
                  height: 100,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your Username',
                  textEditingController: _emailControler,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Tell us about yourself',
                  textEditingController: _emailControler,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your Email',
                  textEditingController: _emailControler,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Password',
                  textEditingController: _passwordControler,
                  textInputType: TextInputType.visiblePassword,
                  password: true,
                ),
                SizedBox(height: 10),
                SizedBox(height: 35),
                InkWell(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Posts()),
                      );
                    },
                    child: Container(
                      child: Text(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
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
