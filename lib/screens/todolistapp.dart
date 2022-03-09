import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/task.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/all_tasks.dart';

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({Key? key, required this.listTasks}) : super(key: key);

  final List<Task> listTasks;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do list',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: AllTasks(title: 'To do list', listTasks: listTasks),
    );
  }
}