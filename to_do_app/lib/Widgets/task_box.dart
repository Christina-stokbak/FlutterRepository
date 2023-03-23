import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/task.dart';

class TaskListItem extends StatefulWidget {
  const TaskListItem({super.key, required this.task});

  final Task task;

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  final DateFormat timeFormatter = DateFormat.Hm();

  final border = const BorderSide(color: Colors.black);
  bool finished = false;

  void finishTask(bool value) {
    setState(() {
      
    });
    widget.task.finished = value;
    finished = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all()),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(widget.task.description),
              const SizedBox(height: 5,),
              Text(
                  '${timeFormatter.format(widget.task.date)}-${timeFormatter.format(widget.task.endTime)}'),
            ],
          ),
          Switch(
            value: finished, 
            onChanged: finishTask
          ),
        ],
      ),
    );
  }
}
