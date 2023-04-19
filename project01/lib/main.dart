import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project01/pages/Welcome.dart';

void main() async {
  await Hive.initFlutter();
  // open a box box
  void box=await Hive.openBox('mybox');

  runApp(MaterialApp(
    home: TodoApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    title: 'Todo App',
  ));
}

class TodoApp extends StatefulWidget {
  @override
  welcome createState() => welcome();
}
