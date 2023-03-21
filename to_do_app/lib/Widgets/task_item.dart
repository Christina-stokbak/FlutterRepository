import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/task.dart';

class TaskItem extends StatelessWidget {
  TaskItem({
    super.key,
    required this.task,
  });

  final Task task;
  final DateFormat dateFormat = DateFormat("d. MMMM");

  final DateFormat timeFormatter = DateFormat.Hm();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "${dateFormat.format(task.date)} ${timeFormatter.format(task.date)}-${timeFormatter.format(task.endTime)}"),
                ],
              ),
              Switch(
                value: false,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        Image.network(
            "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg"),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            task.description,
            textAlign: TextAlign.left,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            height: 100,
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(hintText: "Noter:"),
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
      ],
    );
  }
}