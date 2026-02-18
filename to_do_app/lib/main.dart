import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/view/home_screen.dart';
import 'controllers/task_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple ToDo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Arial',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}