import 'package:add_thing_todo/res/app_theme.dart';
import 'package:add_thing_todo/view/introduction/introduction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: const Introduction(),
    );
  }
}
