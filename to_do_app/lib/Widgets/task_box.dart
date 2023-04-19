import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/Utils/color_themes.dart';
import 'package:to_do_app/Widgets/my_switch.dart';

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

  void openPage(context, String page) {
    Navigator.pushNamed(context, '/$page', arguments: widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border.symmetric(horizontal: BorderSide())),
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
              activeColor: ThemeColors.appBarColor,
              value: finished, 
              onChanged: finishTask
            ),
            // MySwitch(value: finished, onChanged: finishTask)
          ],
        ),
      ),
      onTap: () => {openPage(context, "TaskPage")},
    );
  }
}
