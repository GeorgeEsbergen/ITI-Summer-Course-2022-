import 'package:flutter/material.dart';

class TextForms extends StatelessWidget {
  final Color textColor = const Color(0xff03C19B);
  final int maxLen;

  final TextInputType inputType;
  final Icon? suffixIcon;
  final Icon? prefixIcons;
  final String hintText;
  final String labelText;
  final String returnedError;
  final bool obscureText;

  const TextForms({
    super.key,
    required this.maxLen,
    required this.inputType,
    this.suffixIcon,
    required this.prefixIcons,
    required this.hintText,
    required this.labelText,
    required this.returnedError,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLen,
      cursorColor: textColor,
      keyboardType: inputType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcons,
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.black),
        label: Text(
          labelText,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      validator: (eml) {
        if (eml == null) return null;
        if (eml.isEmpty) {
          return returnedError;
        }

        return null;
      },
    );
  }
}
