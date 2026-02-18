import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';
import 'add_task_screen.dart';
import 'widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Header Section (Dynamic Title & Icon)
              Consumer<TaskController>(
                builder: (context, controller, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getTitle(controller.filterIndex),
                            style: const TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'October 15',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: controller.filterIndex == 0
                            ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
                          );
                        }
                            : null,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _getIconColor(controller.filterIndex),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _getIcon(controller.filterIndex),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),

              // Task List
              Expanded(
                child: Consumer<TaskController>(
                  builder: (context, controller, child) {
                    return ListView.builder(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        final task = controller.tasks[index];
                        return TaskTile(
                          task: task,
                          onToggle: () => controller.toggleTask(task.id),
                          onDelete: () => controller.deleteTask(task.id),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Filter Bottom Bar
              _buildFilterBar(context),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 1:
        return 'Pending';
      case 2:
        return 'Completed';
      default:
        return 'Tasks';
    }
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 1:
        return Icons.access_time_filled;
      case 2:
        return Icons.check_circle;
      default:
        return Icons.add;
    }
  }

  Color _getIconColor(int index) {
    switch (index) {
      case 1:
        return Colors.orangeAccent;
      case 2:
        return Colors.teal;
      default:
        return Colors.black;
    }
  }

  Widget _buildFilterBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Consumer<TaskController>(
        builder: (context, controller, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _filterButton(context, 0, 'All', controller),
              _filterButton(context, 1, 'Pending', controller),
              _filterButton(context, 2, 'Completed', controller),
            ],
          );
        },
      ),
    );
  }

  Widget _filterButton(BuildContext context, int index, String text, TaskController controller) {
    final isSelected = controller.filterIndex == index;
    return GestureDetector(
      onTap: () => controller.setFilter(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}