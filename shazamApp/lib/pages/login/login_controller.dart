import 'package:flutter/material.dart';

class LoginController{

  BuildContext? context;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Future? init(BuildContext context){
    this.context = context;
  }

  void goToRegisterPage(BuildContext context){
    Navigator.pushNamed(context, 'register');
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
  }

}