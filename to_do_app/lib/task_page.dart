import 'package:flutter/material.dart';
import 'package:to_do_app/Models/task.dart';

import 'Widgets/task_item.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.task});

  final Task task;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.arrow_back),
        //   )
        // ],
        title: Text(widget.task.description),
      ),
      body: TaskItem(task: widget.task),
    );
  }
}


