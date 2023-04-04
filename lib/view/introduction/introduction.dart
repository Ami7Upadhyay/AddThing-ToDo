import 'package:add_thing_todo/view/introduction/get_started.dart';
import 'package:add_thing_todo/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../introduction/widgets/intro.dart';
import '../introduction/widgets/page_indicator.dart';

class Introduction extends StatefulWidget {
  static const path = '/introduction';
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction>
    with TickerProviderStateMixin {
  PageController? _pageController;
  double progress = 0;
  int currentIndex = 0;
  Animation? animation;
  AnimationController? animationController;

  List<PageViewModel> pageViews = const [
    PageViewModel(
        image: 'intro_1',
        title: "Manage your tasks",
        subtitle:
            "You can easily manage all of your daily tasks in DoMe for free"),
    PageViewModel(
        image: 'intro_2',
        title: "Create daily routine",
        subtitle:
            "In Uptodo  you can create your personalized routine to stay productive")
  ];

  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          progress = _pageController?.page ?? 1;
        });
      });

    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _content(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: TextButton(
        child: Text(
          'skip',
          style: TextStyle(color: Colors.white.withOpacity(0.44), fontSize: 16),
        ),
        onPressed: () {
          context.pushReplacement(LoginPage.path);
        },
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 15, 24, 40),
      child: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: onPageChanged,
              itemCount: pageViews.length,
              itemBuilder: (BuildContext cotext, int index) {
                PageViewModel pageViewModel = pageViews[index];
                return Intro(
                  image: pageViewModel.image,
                  title: pageViewModel.title,
                  subTitle: pageViewModel.subtitle,
                );
              }),
          Container(
            margin: EdgeInsets.fromLTRB(
                (MediaQuery.of(context).size.width / 2) - 24 - 24, 0, 0, 80),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: PageIndicator(
                    length: pageViews.length, currentIndex: currentIndex)),
          ),
          Align(alignment: Alignment.bottomCenter, child: _backAndNextBtn())
        ],
      ),
    );
  }

  Widget _backAndNextBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [currentIndex != 0 ? _backBtn() : const Spacer(), _nextBtn()],
    );
  }

  Widget _backBtn() {
    return TextButton(
      onPressed: () {
        _pageController?.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: Text(
        'BACK',
        style: TextStyle(color: Colors.white.withOpacity(0.44), fontSize: 16),
      ),
    );
  }

  Widget _nextBtn() {
    return ElevatedButton(
      onPressed: () {
        if ((pageViews.length - 1) == currentIndex) {
          context.push(GetStartedPage.path);
        }
        _pageController?.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
      child: Text(
        (pageViews.length - 1) == currentIndex ? "GET STARTED" : 'NEXT',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class PageViewModel {
  final String image;
  final String title;
  final String subtitle;

  const PageViewModel(
      {required this.image, required this.title, required this.subtitle});
}
