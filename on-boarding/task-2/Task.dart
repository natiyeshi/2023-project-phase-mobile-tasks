

class Task {
  String? title;
  String? desc;
  dynamic dueDate = DateTime.now();
  bool status = false;

  Task(this.title, this.desc);
  // Task(title, desc) {
  //   this.title = title;
  //   this.desc = desc;
  // }
}
