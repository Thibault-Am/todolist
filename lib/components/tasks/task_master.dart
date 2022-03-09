import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/task.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatelessWidget {
  final List<Task> listTasks;
  final Function hideDetails;
  final Function onUpdateTask;
  final Function onDeleteTask;
  final Function showDetailsWhenTaskIsSelected;
  final Function isSelected;
  final Function onProductSelected;

  TaskMaster({Key? key, required this.listTasks,required this.hideDetails, required this.onUpdateTask, required this.onDeleteTask, required this.showDetailsWhenTaskIsSelected
    , required this.isSelected, required this.onProductSelected})
      : super(key: key); //constructor

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showDetailsWhenTaskIsSelected(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(8.0),
            itemCount: listTasks.length,
            itemBuilder: (context, index) {
              return TaskPreview(
                task: listTasks[index],
                onSelect: onProductSelected,
                selected: isSelected(index),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
            )
          ),

      ],
    );
  }
}


/*class TaskMaster extends StatefulWidget {
  final List<Task> listTasks;

  TaskMaster({Key? key, required this.listTasks})
      : super(key: key); //constructor

  // This widget is the root of your application.
  @override
  State<TaskMaster> createState() => _TaskMasterState();
}

class _TaskMasterState extends State<TaskMaster> {
  get listTasks => widget.listTasks;
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
  void onValidateTask(Task task){
    setState(() {
      task.completed = !task.completed;
      this.hideDetails();
    });
  }
  void onDeleteTask(Task task){
    setState(() {
      listTasks.remove(task);
      this.hideDetails();
    });
  }

  //affichage conditionnel
  Widget _showDetailsWhenTaskIsSelected() {
    return (selectedTask != null)
        ? TaskDetails(task: selectedTask, onHide: hideDetails,onValidateTask: onValidateTask, onDeleteTask: onDeleteTask)
        : Container();
  }

  bool _isSelected(int index) {
    return selectedTask == widget.listTasks[index];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _showDetailsWhenTaskIsSelected(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(8.0),
            itemCount: widget.listTasks.length,
            itemBuilder: (context, index) {
              return TaskPreview(
                task: widget.listTasks[index],
                onSelect: onProductSelected,
                selected: _isSelected(index),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
            )
          ),

      ],
    );
  }
}*/