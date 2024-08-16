
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isNumber;
  final bool isPassword;
  final bool isEmail;

  const CustomTextField({
    required this.label,
    this.controller,
    this.isNumber = false,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isNumber
            ? TextInputType.number
            : (isEmail ? TextInputType.emailAddress : TextInputType.text),
                    inputFormatters: isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color(0xFF874590),
          ),
          contentPadding: EdgeInsets.only(bottom: 2.0),
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF874590),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF874590),
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
