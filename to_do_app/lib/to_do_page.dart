import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/Utils/color_themes.dart';
import 'package:to_do_app/Widgets/drawer_menu.dart';
import 'package:to_do_app/task_page.dart';

import 'Models/task.dart';
import 'Widgets/task_box.dart';

class ToDoPage extends StatelessWidget {
  ToDoPage({super.key});

  final DateFormat timeFormatter = DateFormat.Hm();
  final DateFormat dateFormat = DateFormat.yMd();
  final List<Task> tasks = [
    Task(
        description: 'skift elmåler',
        date: DateTime(2023, 3, 9, 9, 0),
        duration: 3),
    Task(
        description: 'Skift ledning',
        date: DateTime(2023, 3, 9, 12, 0),
        duration: 2),
    Task(
        description: 'Skift kontakt',
        date: DateTime(2023, 3, 9, 14, 0),
        duration: 2)
  ];

  void openPage(context, String page) {
    Navigator.pushNamed(context, '/$page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Dato: ${dateFormat.format(DateTime.now())}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => {openPage(context, "TaskPage")},
                  child: TaskListItem(
                    task: tasks[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
