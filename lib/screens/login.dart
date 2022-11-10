import 'package:flutter/material.dart';
import 'package:itesogram/logic/auth_methods.dart';
import 'package:itesogram/screens/home.dart';
import 'package:itesogram/screens/signup.dart';
import 'package:itesogram/utils/colors.dart';
import 'package:itesogram/utils/utils.dart';

import '../responsive/layout_screen.dart';
import '../responsive/web_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordVisible = false;
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String errorMessage = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (errorMessage == 'Login success') {
      //showSnackBar(errorMessage, context);
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
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Signup(),
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
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 64,
                ),
                Container(
                  child: Image.asset('assets/images/icon.png'),
                  height: 200,
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  obscureText:
                      !_passwordVisible, //This will obscure text dynamically
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
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
                    onTap: loginUser,
                    child: Container(
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
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
                  onTap: navigateToSignup,
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
