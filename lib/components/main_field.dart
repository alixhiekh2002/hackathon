import 'package:flutter/material.dart';

class MainField extends StatefulWidget {
  final String placeholder;
  final Icon icon;
  final Color borderColor;

  MainField(
      {super.key,
      required this.placeholder,
      required this.icon,
      required this.borderColor, });
  @override
  State<MainField> createState() => _MainFieldState();
}

class _MainFieldState extends State<MainField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.borderColor,
            width: 2.0,
          )),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          contentPadding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
          hintText: widget.placeholder,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
