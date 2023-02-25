import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textInputType,
    required this.isPassword,
    required this.hintText,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  final TextInputType textInputType;
  final bool isPassword;
  final String hintText;
  final TextEditingController controller;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      textAlign: TextAlign.justify,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        prefix: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: icon,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
