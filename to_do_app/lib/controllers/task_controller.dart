import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskController extends ChangeNotifier {
  final List<Task> _tasks = [];
  int _filterIndex = 0;

  List<Task> get tasks {
    if (_filterIndex == 1) {
      return _tasks.where((task) => !task.isCompleted).toList();
    } else if (_filterIndex == 2) {
      return _tasks.where((task) => task.isCompleted).toList();
    }
    return _tasks;
  }

  int get filterIndex => _filterIndex;

  void addTask(String title, DateTime date, String category) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
      date: date,
      category: category,
    );
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTask(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void setFilter(int index) {
    _filterIndex = index;
    notifyListeners();
  }
}