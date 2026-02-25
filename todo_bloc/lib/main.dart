import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bolcs/todo_bloc/task_cubit.dart';
import 'package:todo_bloc/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
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
