import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/task.dart';

class TaskBox extends StatefulWidget {
  const TaskBox({super.key, required this.task});

  final Task task;

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
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
