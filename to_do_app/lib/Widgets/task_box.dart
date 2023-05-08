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
  final DateFormat dateFormatter = DateFormat('d/M');

  final border = const BorderSide(color: Colors.black);
  bool finished = false;

  void finishTask(bool value) {
    setState(() {});
    widget.task.finished = value;
    finished = value;
  }

  void openTaskPage(context) {
    Navigator.pushNamed(context, '/TaskPage', arguments: widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide())),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(dateFormatter.format(widget.task.date),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '${timeFormatter.format(widget.task.date)}-${timeFormatter.format(widget.task.endTime)}',
                  textAlign: TextAlign.left,
                  ),
              ],
            ),
            Switch(
                activeColor: ThemeColors.appBarColor,
                value: finished,
                onChanged: finishTask),
            // MySwitch(value: finished, onChanged: finishTask)
          ],
        ),
      ),
      onTap: () => {openTaskPage(context)},
    );
  }
}
