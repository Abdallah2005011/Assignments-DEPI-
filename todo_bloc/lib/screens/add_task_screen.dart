import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bolcs/todo_bloc/task_cubit.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'Personal';

  final List<String> _categories = [
    'Personal',
    'Work',
    'Health',
    'Learning',
    'Family'
  ];

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Personal':
        return Icons.person_outline;
      case 'Work':
        return Icons.work_outline;
      case 'Health':
        return Icons.favorite_border;
      case 'Learning':
        return Icons.school_outlined;
      case 'Family':
        return Icons.people_outline;
      default:
        return Icons.category_outlined;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Personal':
        return Colors.blue;
      case 'Work':
        return Colors.purple;
      case 'Health':
        return Colors.red;
      case 'Learning':
        return Colors.orange;
      case 'Family':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add a task',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name your task", style: TextStyle(color: Colors.grey)),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Enter task name',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 30),

            const Text("Date", style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                Text(
                  "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),
            const SizedBox(height: 30),

            const Text("Category", style: TextStyle(color: Colors.grey)),
            DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              underline: Container(height: 1, color: Colors.grey),
              icon: const Icon(Icons.keyboard_arrow_down),
              items: _categories.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(value).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getCategoryIcon(value),
                          color: _getCategoryColor(value),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isEmpty) return;

                  context.read<TaskCubit>().addTask(
                    _titleController.text,
                    _selectedDate,
                    _selectedCategory,
                  );
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
