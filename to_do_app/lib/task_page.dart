import 'package:flutter/material.dart';
import 'package:to_do_app/Models/task.dart';

import 'Widgets/task_item.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});


  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {


  @override
  Widget build(BuildContext context) {
  final Task task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.arrow_back),
        //   )
        // ],
        title: Text(task.description),
      ),
      body: TaskItem(task: task),
    );
  }
}


