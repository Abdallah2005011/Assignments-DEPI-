import '../../models/task_model.dart';

class TaskState {
  final List<Task> tasks;
  final int filterIndex;

  const TaskState({
    required this.tasks,
    required this.filterIndex,
  });

  List<Task> get filteredTasks {
    if (filterIndex == 1) {
      return tasks.where((task) => !task.isCompleted).toList();
    } else if (filterIndex == 2) {
      return tasks.where((task) => task.isCompleted).toList();
    }
    return tasks;
  }

  TaskState copyWith({
    List<Task>? tasks,
    int? filterIndex,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      filterIndex: filterIndex ?? this.filterIndex,
    );
  }
}
