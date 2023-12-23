import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;

  TextEditingController nameController = TextEditingController();


  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController telephoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();


  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }

  void register() {
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    String telephone = telephoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
  }
}
