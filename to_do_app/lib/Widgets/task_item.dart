import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../Models/task.dart';
import '../Utils/color_themes.dart';

class TaskItem extends StatefulWidget {
  TaskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late DateFormat dateFormat;

  final DateFormat timeFormatter = DateFormat.Hm();

  late bool finished;

  final notesController = TextEditingController();

  @override
  void initState() {
    finished = widget.task.finished;
    initializeDateFormatting('da_DK', null);
    dateFormat = DateFormat("d. MMMM", "da_DK");
    super.initState();
  }

  void finishTask(bool value) {
    setState(() {});
    widget.task.finished = value;
    finished = value;
  }

  void saveNotes() {
    if (notesController.text != "") widget.task.notes = notesController.text;
  }

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
                    widget.task.description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "${dateFormat.format(widget.task.date)} ${timeFormatter.format(widget.task.date)}-${timeFormatter.format(widget.task.endTime)}"),
                ],
              ),
              Switch(
                activeColor: ThemeColors.appBarColor,
                value: finished,
                onChanged: finishTask,
              ),
            ],
          ),
        ),
        Image.asset("assets/map_image_example.png"),
        // Image.network(
        //     "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg"),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Beskrivelse",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.task.description,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 100,
            child: TextField(
              controller: notesController,
              maxLines: null,
              decoration: const InputDecoration(hintText: "Noter:"),
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
        Expanded(child: Flex(direction: Axis.vertical,)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ElevatedButton(
            onPressed: saveNotes,
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(ThemeColors.appBarColor)),
            child: const Text('Gem'),
            
          ),
        ),
      ],
    );
  }
}
