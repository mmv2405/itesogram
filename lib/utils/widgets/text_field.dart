import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  //Variables to re-use widget
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final bool password;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
      ),
      keyboardType: textInputType,
      obscureText: password,
    );
  }
}
