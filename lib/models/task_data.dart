import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Tasks.dart';


class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  TaskData() {
    _loadTasks();
  }


  Task getTask(int index){
    return _tasks[index];
  }

  int get taskCount {
    return _tasks.length;
  }

  Future<void> _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskStrings = _tasks.map((task) => task.name).toList();
    prefs.setStringList('tasks', taskStrings);
  }

  // Load tasks from SharedPreferences
  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskStrings = prefs.getStringList('tasks');
    if (taskStrings != null) {
      _tasks = taskStrings.map((taskString) => Task(name: taskString)).toList();
    }
    notifyListeners();
  }

  // Override the addTask method to save tasks after adding
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
    _saveTasks();
  }

  // Override the deleteTask method to save tasks after deletion
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    _saveTasks();
  }

}
