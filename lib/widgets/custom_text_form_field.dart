import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.hintText, this.onChanged, this.keyboradTpe });
  Function(String)? onChanged;
  String? hintText;
  TextInputType? keyboradTpe;
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      keyboardType: keyboradTpe,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
