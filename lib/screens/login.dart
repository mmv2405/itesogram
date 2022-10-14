import 'package:flutter/material.dart';
import 'package:itesogram/screens/signup.dart';
import 'package:itesogram/utils/colors.dart';
import 'package:itesogram/utils/widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/icon.png'),
                  height: 200,
                ),
                SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Number, username or email',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot your password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                InkWell(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: Container(
                      child: Text(
                        'Log In',
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
                  onTap: () {},
                  child: Container(
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
                //Button login
              ],
            ),
          ),
        ),
      ),
    );
  }
}
