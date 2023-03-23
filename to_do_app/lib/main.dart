import 'package:to_do_app/Models/task.dart';
import 'package:to_do_app/Utils/color_themes.dart';
import 'package:to_do_app/task_page.dart';
import 'package:to_do_app/to_do_page.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/weather_page.dart';


void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: ThemeColors.appBarColor)
      ),
      routes: {'/TaskPage': (context) => TaskPage(task: Task(description: "Skift elmåler", date: DateTime(2023, 3, 9, 9, 0), duration: 2)),
      '/ToDoPage': (context) => ToDoPage(),
      '/WeatherPage':(context) => WeatherPage()},
    );
  }
}






// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'To Do List'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
