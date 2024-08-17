
import 'package:albedo/components/colours.dart';
import 'package:albedo/components/text_sizes.dart';
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
            color: AppColors.primary,fontSize: TextSizes.bodyTextSize(context),
          ),
          contentPadding: EdgeInsets.only(bottom: 2.0),
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
