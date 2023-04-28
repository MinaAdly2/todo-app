import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mmd/blocs/app_theme_bloc/app_theme_bloc.dart';
import 'package:todo_mmd/blocs/home_bloc/home_bloc.dart';
import 'package:todo_mmd/main.dart';
import 'package:todo_mmd/models/tasks_list.dart';
import 'package:todo_mmd/screens/search_screen.dart';
import 'package:todo_mmd/widgets/custom_bottom_sheet.dart';
import 'package:todo_mmd/widgets/task_item.dart';

// ignore: must_be_immutable
class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(GridEvent());
          },
          icon: const Icon(
            Icons.grid_view_rounded,
          ),
        ),
        title: const Text(
          'My Tasks',
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchScreen());
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, top: 30, bottom: 10),
            child: Text(
              "What's on your mind?",
              style: TextStyle(
                color:
                    isDark ? const Color(0xFFFFFFFF) : const Color(0xFFF97D7D),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'RobotoItalic',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 22,
                end: 39,
                top: 30,
              ),
              child: ListView.separated(
                itemCount: tasksList.length,
                itemBuilder: (context, index) =>
                    TaskItemList(taskModel: tasksList[index]),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) => CustomBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                isDark
                    ? BlocProvider.of<AppThemeBloc>(context)
                        .add(LightModeEvent())
                    : BlocProvider.of<AppThemeBloc>(context)
                        .add(DarkModeEvent());
              },
              icon: isDark
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined),
            ),
            label: isDark ? 'Day Light' : 'Night Light',
          ),
        ],
      ),
    );
  }
}
