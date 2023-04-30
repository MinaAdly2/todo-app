import 'package:flutter/material.dart';
import 'package:todo_mmd/app_localization.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onTap});
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          top: 30,
          bottom: 30,
        ),
        child: Container(
          height: 57.2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF9D1212),
          ),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.translate('Save'),
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 30,
                fontWeight: FontWeight.w400,
                fontFamily: 'InterRegular',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
