import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? funcion;
  final Color fondo;
  final Color borde;
  final String seguido;
  final Color colorSeguido;
  const FollowButton(
      {super.key,
      this.funcion,
      required this.fondo,
      required this.borde,
      required this.seguido,
      required this.colorSeguido});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: TextButton(
        onPressed: () {
          funcion;
        },
        child: Container(
          decoration: BoxDecoration(
              color: fondo,
              border: Border.all(color: borde),
              borderRadius: BorderRadius.circular(5)),
          alignment: Alignment.center,
          child: Text(
            seguido,
            style: TextStyle(color: colorSeguido, fontWeight: FontWeight.bold),
          ),
          width: 250,
          height: 27,
        ),
      ),
    );
  }
}
