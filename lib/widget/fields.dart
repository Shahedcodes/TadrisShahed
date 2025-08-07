import 'package:flutter/material.dart';
import 'package:tadris/core/theme/app_pallete.dart';

class Authfields extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const Authfields({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        filled: true, // Adds a background color
        fillColor: Colors.white, // Background color of the text field
        hintText: hintText, // Placeholder text
        hintStyle: const TextStyle(
          color: AppColors.darkpurple, // Hint text color
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15, horizontal: 20), // Inside padding
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          borderSide: BorderSide(
            color: Colors.grey.shade300, // Border color
            width: 2, // Border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          borderSide: const BorderSide(
            color: AppColors.peachOrange, // Border color when focused
            width: 1, // Border width
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
          borderSide: const BorderSide(
            color: Colors.redAccent, // Border color when there's an error
            width: 2, // Border width
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red, // Border color when error and focused
            width: 2,
          ),
        ),
      ),
      style: const TextStyle(fontSize: 17),
      validator: (value) {
        if (value!.isEmpty) {
          // ignore: unnecessary_string_interpolations
          return "$hintText غير موجود";
        }
        return null;
      },
      obscureText: isObscureText, // Text style inside the field
    );
  }
}
