import "Task.dart";

class TaskManager {
  List<Task> tasks = [];
  
  TaskManager();

  void addTask(Task task) {
    tasks.add(task);
  }

  String printTask(Task element,{int count = 1}) {
    String temp = "";
    temp += "$count. title : ${element.title ?? ''} , ";
    temp += " description : ${element.desc ?? ''}, ";
    temp += " due date :   ${element.dueDate.hour}:${element.dueDate.minute} , ";
    temp += " status : ${element.status ? 'completed' : "pending"} \n";
    return temp;
  }

  String? getAllTasks() {
    String allTasks = "";
    int i = 0;
    tasks.forEach((element) {
      allTasks += printTask(element,count : ++i);
    });

    return allTasks;
  }

  String? getCompletedTasks() {
    String allTasks = "";
    int i = 0;

    tasks.forEach((element) {
      if (element.status == false) return;
      allTasks += printTask(element,count : ++i);
    });

    return allTasks;
  }

  String? getPendingTasks() {
    String allTasks = "";
    int i = 0;
    tasks.forEach((element) {
      if (element.status == true) return;
      allTasks += printTask(element,count : ++i);
    });

    return allTasks;
  }
}
