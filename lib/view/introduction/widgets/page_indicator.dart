import 'package:add_thing_todo/res/colors.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final int length;
  final int currentIndex;
  const PageIndicator(
      {Key? key, required this.length, required this.currentIndex})
      : super(key: key);

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return SizedBox(
      height: 5,
      child: ListView.builder(
          itemCount: widget.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => _indicator(index)),
    );
  }

  Widget _indicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 26,
      decoration: BoxDecoration(
          color: index == widget.currentIndex ? lavender : colorAFAFAF,
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
