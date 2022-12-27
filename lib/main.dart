import 'package:flutter/material.dart';
import 'package:todo_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomeScreen(),
    );
  }
}
