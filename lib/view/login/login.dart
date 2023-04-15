import 'package:add_thing_todo/res/colors.dart';
import 'package:add_thing_todo/view/login/register.dart';
import 'package:add_thing_todo/view/login/widgets/login_signup_form.dart';
import 'package:add_thing_todo/view/task/add_task.dart';
import 'package:add_thing_todo/view/task/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const path = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_form(), _alreadyHaveAccount(context)],
        ),
      ),
    );
  }

  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _title(),
        const SizedBox(height: 50),
        _loginSignUpForm(),
      ],
    );
  }

  Widget _title() {
    return const Text(
      "Login",
      style: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),
    );
  }

  Widget _loginSignUpForm() {
    return LoginSingUpForm(
      isLoading: isLoading,
      onFormSubmit: (bool isValidate) {
        context.push(HomePage.path);
        setState(() {
          isLoading = true;
        });
        Future.delayed(const Duration(seconds: 5), () {
          setState(() {
            isLoading = false;
          });
        });
      },
    );
  }

  Widget _alreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: color535353, fontSize: 15)),
        TextButton(
            onPressed: () {
              context.push(RegisterPage.path);
            },
            child: const Text("Login",
                style: TextStyle(color: Colors.white, fontSize: 18)))
      ],
    );
  }
}
