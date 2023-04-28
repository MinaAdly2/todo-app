import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mmd/blocs/home_bloc/home_bloc.dart';
import 'package:todo_mmd/widgets/custom_button.dart';
import 'package:todo_mmd/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});
  String? title;
  String? task;
  TextEditingController? titleController;
  TextEditingController? taskController;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 16,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF797979),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 6.09,
                  width: 143,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(
                top: 20,
                start: 16,
              ),
              child: Text(
                'Todo Title',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'InterRegular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
                top: 16,
                end: 60,
              ),
              child: CustomTextFormField(
                hint: 'Todo Title',
                onChange: (data) {
                  title = data;
                  debugPrint(data);
                },
                validator: (String? data) {
                  if (data?.isEmpty ?? true) {
                    return 'The title is required';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(
                top: 20,
                start: 16,
              ),
              child: Text(
                'Task',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'InterRegular',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
                top: 16,
                end: 60,
              ),
              child: CustomTextFormField(
                hint: 'Write anything in your mind',
                onChange: (data) {
                  task = data;
                  debugPrint(data);
                },
                validator: (String? data) {
                  if (data?.isEmpty ?? true) {
                    return 'The task is required';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(SaveTaskEvent(title: title!, task: task!));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
