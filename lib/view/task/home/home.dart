import 'package:add_thing_todo/extension/asset_image.dart';
import 'package:add_thing_todo/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  static const path = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: _buildContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: lavender,
        child: const Icon(
          Icons.add,
          size: 26,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return _emptyWidget();
  }

  Widget _emptyWidget() {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 250,
              width: 250,
              image: AssetImage('home'.toPng),
            ),
            const Text(
              'What do you want to do today?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 15),
            const Text(
              'Tap + to add your tasks',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ]),
    );
  }
}
