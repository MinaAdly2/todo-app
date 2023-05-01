import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mmd/app_localization.dart';
import 'package:todo_mmd/blocs/task_bloc/task_bloc.dart';
import 'package:todo_mmd/widgets/custom_button.dart';
import 'package:todo_mmd/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.taskController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController taskController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 6.1,
                width: 143,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 20,
              start: 16,
            ),
            child: Text(
              'Todo Title'.translate(context),
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
              hint: 'Todo Title'.translate(context),
              controller: titleController,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 20,
              start: 16,
            ),
            child: Text(
              'Task'.translate(context),
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
              hint: 'Write anything in your mind'.translate(context),
              controller: taskController,
            ),
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<TaskBloc>(context).add(SaveTaskEvent(
                    title: titleController.text, task: taskController.text));
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
