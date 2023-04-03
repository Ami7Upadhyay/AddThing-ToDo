import 'package:add_thing_todo/res/colors.dart';
import '../../../extension/asset_image.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const Intro(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeIn);
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return FadeTransition(
      opacity: animation!,
      child: Container(
        color: color121212,
        child: Column(children: [
          _image(),
          const SizedBox(height: 30),
          _title(),
          const SizedBox(height: 20),
          _subTitle()
        ]),
      ),
    );
  }

  Widget _image() {
    return Image(
      image: AssetImage(widget.image.toPng),
      height: 277,
      width: 213,
    );
  }

  Widget _title() {
    return Text(
      widget.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),
    );
  }

  Widget _subTitle() {
    return Text(
      widget.subTitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
