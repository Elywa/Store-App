import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hint, this.onChanged, this.obsecure = false , this.keyboradTpe});
  String? hint;
  bool? obsecure;
  Function(String value)? onChanged;
  TextInputType? keyboradTpe;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboradTpe,
      obscureText: obsecure!,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
