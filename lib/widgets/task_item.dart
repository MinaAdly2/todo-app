import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mmd/blocs/task_bloc/task_bloc.dart';
import 'package:todo_mmd/main.dart';
import 'package:todo_mmd/models/task_model.dart';
import 'package:todo_mmd/theme/theme_data_dark.dart';
import 'package:todo_mmd/theme/theme_data_light.dart';

class TaskItemList extends StatelessWidget {
  const TaskItemList({Key? key, required this.taskModel}) : super(key: key);
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? getThemeDataDark().primaryColor
            : getThemeDataLight().primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_box_outlined,
              color: Color(0xffFFFFFF),
              size: 30,
            ),
          ),
          title: Text(
            taskModel.title,
            style: const TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'RobotoRegular',
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 8,
              top: 10,
              bottom: 16,
            ),
            child: Text(
              taskModel.task,
              style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              BlocProvider.of<TaskBloc>(context)
                  .add(DeleteTaskEvent(taskModel: taskModel));
            },
            icon: const Icon(
              Icons.delete,
              color: Color(0xffFFFFFF),
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class TaskItemGrid extends StatelessWidget {
  const TaskItemGrid({required this.taskModel, super.key});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 3,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? getThemeDataDark().primaryColor
              : getThemeDataLight().primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 10,
            top: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.title,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'RobotoRegular',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: Text(
                    taskModel.task,
                    style: const TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_box_outlined,
                      color: Color(0xffFFFFFF),
                      size: 30,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<TaskBloc>(context)
                            .add(DeleteTaskEvent(taskModel: taskModel));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Color(0xffFFFFFF),
                        size: 30,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
