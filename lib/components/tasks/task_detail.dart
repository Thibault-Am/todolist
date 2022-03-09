import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/data/task.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {Key? key,
      required this.task,
      required this.onHide,
      required this.onUpdateTask,
      required this.onDeleteTask})
      : super(key: key);
//constructor
  final Task? task;
  final Function onHide;
  final Function onUpdateTask;
  final Function onDeleteTask;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${task!.completed}',
              ),
              Text(task!.content),
              Text('${task!.createdAt}'),
              IconButton(
                  onPressed: () => onHide(), icon: const Icon(Icons.close)),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () => onUpdateTask(task),
                  child: const Text('Update')),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text(
                          'Are you sure you wanna delete this task!'),
                      action: SnackBarAction(
                        label: 'Delete',
                        onPressed: () {
                          onDeleteTask(task);
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('Delete'))
            ],
          ),
        ),
      ),
    );
  }
}

/*class _TaskDetailsState extends State<TaskDetails> {
  get task => widget.task;

  @override
  Widget build(BuildContext context) {
    var status = task.completed;
    var color;
    if (status == true) {
      color = Colors.green;
    } else {
      color = Colors.red;
    }
    return Scaffold(
        appBar: AppBar(title: const Text('To do list')),
        body: ListTile(
          tileColor: color,
          title: Text('${task.content}'),
          subtitle: Text('${task.createdAt}'),
        ));
  }
}*/
