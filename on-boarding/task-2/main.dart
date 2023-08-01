/*
  => Add a new task
    task -> title,description,dueDate,status
  => View all tasks

  => View only completed tasks

  => View only pending tasks
  
  => Edit a task (update title, description, due date, or status)
  
  => Delete a task

 */

import "dart:io";
import "Task.dart";
import "TaskManager.dart";

class Start {
  static TaskManager taskManager = TaskManager();
  Start() {}
  static void welcome() {
    print("0 exit");
    print("1 Add a new task");
    print("2 View all tasks");
    print("3 View only completed tasks");
    print("4 View only pending tasks");
    print("5 Edit a task ");
    print("6 Delete a task");
  }

  static String? getValue(String display) {
    print(display + " : ");
    return stdin.readLineSync();
    // title : t1
  }

  static void addNewTask() {
    String? title = getValue("title");
    String? desc = getValue("description");
    Task task = Task(title, desc);
    taskManager.addTask(task);
  }

  static void showAll() {
    print(taskManager.getAllTasks());
  }

  static void showCompleted() {
    print(taskManager.getCompletedTasks());
  }

  static void showPending() {
    print(taskManager.getPendingTasks());
  }

  static void delete() {
    showAll();
    try {
      String? choice =
          getValue("insert number your Task number you want to edit");
      int val = int.parse(choice ?? "0");
      if (val == 0 || val > taskManager.tasks.length) throw "";
      taskManager.tasks.removeAt(val - 1);
      print("deleted successfully!!");
    } catch (e) {
      print("something goes wrong!! sorry :)");
    }
  }

  static void edit() {
    showAll();
    try {
      String? choice =
          getValue("insert your Task number you want to edit");
      int val = int.parse(choice ?? "0");
      if (val == 0 || val > taskManager.tasks.length) throw "";
     
      print(taskManager.printTask(taskManager.tasks[val - 1]));
     
      print(
          "if you dont want to edit specific status just jump it by clicking enter!\n");
      String? title = getValue("title");
      if (title != null && title != "") {
        taskManager.tasks[val - 1].title = title;
      }
      String? desc = getValue("description");
      if (desc != null && desc != "") {
        taskManager.tasks[val - 1].desc = desc;
      }

      String? status = getValue("status 1 for completed other for pending");
      if (desc != null && status != "") {
        if (status == "1")
          taskManager.tasks[val - 1].status = true;
        else
          taskManager.tasks[val - 1].status = false;
      }

      print("you completely edit you task!!");
    } catch (e) {
      print("wrong input!!");
      return;
    }
  }
}

void main() {
  while (true) {
    Start.welcome();
    String? choice = stdin.readLineSync();
    if (choice == null) continue;
    switch (choice) {
      case "0":
        {
          exit(0);
        }
      case "1":
        {
          Start.addNewTask();
          break;
        }
      case "2":
        {
          Start.showAll();
          break;
        }
      case "3":
        {
          Start.showCompleted();
          break;
        }
      case "4":
        {
          Start.showPending();
          break;
        }
      case "5":
        {
          Start.edit();
          break;
        }
      case "6":
        {
          Start.delete();
          break;
        }
      default:
        break;
    }
    print("enter to continue !");
    stdin.readLineSync();
  }
}
