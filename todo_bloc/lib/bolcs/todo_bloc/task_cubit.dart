import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/task_model.dart';
import 'task_state.dart';
class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState(tasks: [], filterIndex: 0));

  void addTask(String title, DateTime date, String category) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
      date: date,
      category: category,
    );
    emit(state.copyWith(tasks: [...state.tasks, newTask]));
  }

  void toggleTask(String id) {
    final updatedTasks = state.tasks.map((task) {
      if (task.id == id) {
        return Task(
          id: task.id,
          title: task.title,
          date: task.date,
          category: task.category,
          isCompleted: !task.isCompleted,
        );
      }
      return task;
    }).toList();
    emit(state.copyWith(tasks: updatedTasks));
  }

  void deleteTask(String id) {
    final updatedTasks = state.tasks.where((task) => task.id != id).toList();
    emit(state.copyWith(tasks: updatedTasks));
  }

  void setFilter(int index) {
    emit(state.copyWith(filterIndex: index));
  }
}
