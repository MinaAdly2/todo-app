import 'package:flutter/material.dart';
import 'package:todo_mmd/models/task_model.dart';
import 'package:todo_mmd/models/tasks_list.dart';
import 'package:todo_mmd/screens/home_screen.dart';
import 'package:todo_mmd/widgets/task_item.dart';

class SearchScreen extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query == '') {
            close(context, HomeScreen.id);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.search),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<TaskModel> filteredTasks = tasksList
        .where((element) => element.title.toLowerCase().startsWith(query))
        .toList();
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        right: 39,
        top: 30,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: query == '' ? tasksList.length : filteredTasks.length,
        itemBuilder: (context, index) {
          return query == ''
              ? TaskItemList(taskModel: tasksList[index])
              : TaskItemList(taskModel: filteredTasks[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
      ),
    );
  }
}
