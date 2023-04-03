import 'package:add_thing_todo/res/colors.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _content(),
    );
  }

  Widget _content() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 50),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_header(), _loginAndCreateAccountBtn()]),
    );
  }

  Widget _header() {
    return Column(
      children: [
        const SizedBox(height: 60),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Welcome to AddThingToDo",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Please login to your account or create new account to continue',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Widget _loginAndCreateAccountBtn() {
    return Column(
      children: [_loginBtn(), const SizedBox(height: 20), _createAccountBtn()],
    );
  }

  Widget _loginBtn() {
    return SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(onPressed: () {}, child: const Text("LOGIN")));
  }

  Widget _createAccountBtn() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: lavender, width: 2)),
          onPressed: () {},
          child: const Text('CREATE ACCOUNT',
              style: TextStyle(color: Colors.white, fontSize: 16))),
    );
  }
}
