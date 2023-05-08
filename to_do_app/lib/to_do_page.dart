import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/Utils/color_themes.dart';
import 'package:to_do_app/Widgets/drawer_menu.dart';
import 'package:to_do_app/task_page.dart';

import 'Models/task.dart';
import 'Widgets/task_box.dart';

class ToDoPage extends StatefulWidget {
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final DateFormat timeFormatter = DateFormat.Hm();

  final DateFormat dateFormat = DateFormat('d/M/yyyy');

  List<Task> tasks = [];

  loadTasks() async {
    final jsonString = await rootBundle.loadString('assets/mock_tasks.json');

    final List<dynamic> decodedList = jsonDecode(jsonString) as List;

    tasks = decodedList.map((task) {
      return Task.fromJson(task);
    }).toList();
    setState(() {
      
    });
  }
  
  @override
  void initState(){
    loadTasks();
    super.initState();
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
                return TaskListItem(
                  task: tasks[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
