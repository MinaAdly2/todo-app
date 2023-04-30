import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hint,
    this.onChanged,
    this.controller,
  });
  final String hint;
  final void Function(String)? onChanged;
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
      onChanged: onChanged,
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
