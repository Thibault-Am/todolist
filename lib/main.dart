import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/todolistapp.dart';

void main() {
  final listTasks = List<Task>.generate(
    15,
        (index) => Task(
      content: faker.lorem.sentence(),
      completed: Random().nextBool(),
    ),
  );

  runApp(
    ToDoListApp(
      listTasks: listTasks,
    ),
  );
}
