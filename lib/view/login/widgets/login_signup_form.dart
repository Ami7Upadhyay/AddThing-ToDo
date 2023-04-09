import 'package:add_thing_todo/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginSingUpForm extends StatelessWidget {
  LoginSingUpForm(
      {super.key,
      this.isSignUp = false,
      required this.onFormSubmit,
      this.isLoading = false});
  final _formKey = GlobalKey<FormState>();
  final Function(bool isValidate) onFormSubmit;
  final bool isLoading;

  final bool isSignUp;
  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _userNameField(),
            const SizedBox(height: 25),
            _passwordField(),
            const SizedBox(height: 25),
            if (isSignUp) _passwordConfirmField(),
            _signInSinUpBtn()
          ],
        ),
      ),
    );
  }

  Widget _userNameField() {
    return _titleAndTextField(
        title: "Username",
        child: CustomTextField(
          hintText: "Enter your username",
          controller: _userNameEditingController,
          validator: (value) {
            if (value != null) {
              if (value.isEmpty) {
                return "Username can't empty";
              }
            }
            return null;
          },
        ));
  }

  Widget _passwordField() {
    return _titleAndTextField(
      title: "Password",
      child: CustomTextField(
        hintText: "Enter your password",
        obscureText: true,
        controller: _passwordEditingController,
        validator: (value) {
          if (value != null) {
            if (value.isEmpty) {
              return "Password Can't be empty.";
            }
          }
        },
      ),
    );
  }

  Widget _passwordConfirmField() {
    return _titleAndTextField(
      title: "Confirm Password",
      child: CustomTextField(
        hintText: "Enter your confirm password",
        obscureText: true,
        controller: _confirmPasswordEditingController,
        validator: (value) {
          if (value != null) {
            if (value.isEmpty) {
              return "Confirm assword Can't be empty.";
            } else if (_passwordEditingController.text != value) {
              return "Password doesn't match.";
            }
          }
        },
      ),
    );
  }

  Widget _titleAndTextField({required String title, Widget? child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        const SizedBox(height: 10),
        if (child != null) child
      ],
    );
  }

  Widget _signInSinUpBtn() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(isSignUp ? "Register" : 'Login'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            onFormSubmit(true);
          }
        },
      ),
    );
  }
}
