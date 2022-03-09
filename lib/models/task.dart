class Task {
  int id = 0;
  String content = "";
  bool completed = false;
  DateTime createdAt = DateTime.now();

  Task({this.content = "", this.completed = false});
}
