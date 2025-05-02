import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final IconData? prefixIcon;
  final Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validate;
  final TextInputType? textInputType;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.onSaved,
    this.validate,
    this.textInputType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is empty';
        } else {
          return null;
        }
      },
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLines,
      onSaved: onSaved,
      decoration: InputDecoration(
        // prefixIcon: Icon(
        //   prefixIcon,
        // ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        // labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        errorStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}

// class Validators {
//   static String? email(String? value) {
//     if (value == null || value.isEmpty) return 'Email is required';
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//       return 'Enter a valid email';
//     }
//     return null;
//   }
//
//   static String? password(String? value) {
//     if (value == null || value.isEmpty) return 'Password is required';
//     if (value.length < 6) return 'Password too short';
//     return null;
//   }
// }
