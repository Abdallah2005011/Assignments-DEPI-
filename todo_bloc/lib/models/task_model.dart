class Task {
  final String id;
  final String title;
  final DateTime date;
  final String category;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.category,
    this.isCompleted = false,
  });
}