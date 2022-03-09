import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_detail.dart';

import 'package:todolist/data/task.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/models/task.dart';

class AllTasks extends StatefulWidget {
   const AllTasks({Key? key, required this.title, required this.listTasks})
      : super(key: key);
  final String title;

  final List<Task> listTasks;

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late List<Task> listTasks;
  @override
  void initState() {
    super.initState();
    listTasks = widget.listTasks;
  }

  void _addTask() {
    setState(() {
      listTasks.insert(0, Task(content: faker.lorem.sentence(),
      completed: Random().nextBool(),));
    });
  }

  Task? selectedTask;

  void onProductSelected(Task task) {
    setState(() {
      selectedTask = task;
      //when selectedTask has a value, TaskDetails widget is displayed
    });
  }

  void hideDetails() {
    setState(() {
      selectedTask = null;
      //when selectedTask is null TaskDetails widget is hidden
    });
  }
  void onUpdateTask(Task task){
    setState(() {
      task.completed = !task.completed;
      hideDetails();
    });
  }
  void onDeleteTask(Task task){
    setState(() {
      listTasks.remove(task);
      hideDetails();
    });
  }

  //affichage conditionnel
  Widget _showDetailsWhenTaskIsSelected() {
    return (selectedTask != null)
        ? TaskDetails(task: selectedTask, onHide: hideDetails,onUpdateTask: onUpdateTask, onDeleteTask: onDeleteTask)
        : Container();
  }

  bool _isSelected(int index) {
    return selectedTask == widget.listTasks[index];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TaskMaster(
        listTasks: listTasks,
          hideDetails: hideDetails,
          onUpdateTask: onUpdateTask,
          onDeleteTask: onDeleteTask,
          showDetailsWhenTaskIsSelected: _showDetailsWhenTaskIsSelected,
          isSelected:_isSelected,
          onProductSelected: onProductSelected,

      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(),
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),

    );
  }

}
