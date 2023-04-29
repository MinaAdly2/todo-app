import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hint,
    required this.onChange,
    this.controller,
  });
  final String hint;
  final void Function(String)? onChange;
  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: 'InterRegular',
        ),
      ),
      onChanged: onChange,
      validator: (String? data) {
        if (data?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      controller: controller,
    );
  }
}
