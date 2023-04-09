import 'package:flutter/material.dart';
import '../login/widgets/login_signup_form.dart';

class RegisterPage extends StatefulWidget {
  static const path = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            const SizedBox(height: 50),
            LoginSingUpForm(
              isSignUp: true,
              onFormSubmit: (bool isValidate) {},
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Register",
      style: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700),
    );
  }
}
