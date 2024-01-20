import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:multi_store_app/views/buyers/auth/snackbar_widget.dart';
import 'package:multi_store_app/views/buyers/auth/login_screen.dart';

import '../../../controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  bool _isLoading = false;

  late String email;

  late String fullName;

  late String password;
  late String phoneNumber;
  registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String res = await _authController.createNewUser(
        email,
        fullName,
        password,
          phoneNumber
      );

      setState(() {
        _isLoading = false;
      });

      if (res == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
            Text('congratulations account has been created for you..')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('something went wrong'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('please enter all fields')));
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/user_profile_2.png"),
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                    ),
                    onTap: (){
                      //selectImage();
                    },
                  ),
                  textEmailInputWidget(),
                  textFullNameInputWidget(),
                  textPasswordInputWidget(),
                  textPhoneInputWidget(),
                  submitRegiterButton(context),
                  textHaveAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textEmailInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter an email adreess';
          } else {
            return null;
          }
        },
        onChanged: (value) {
          email = value;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Enter your email',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget textPasswordInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a password';
          } else {
            return null;
          }
        },
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Enter your Password',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget textFullNameInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your name';
          } else {
            return null;
          }
        },
        onChanged: (value) {
          fullName = value;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Enter your Full Name',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget textPhoneInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a phone number';
          } else {
            return null;
          }
        },
        onChanged: (value) {
          phoneNumber = value;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Enter your Phone Number',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget submitRegiterButton(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width - 40.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: _isLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  'Register',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
        ),
      ),
      onTap: () {
        registerUser();
      },
    );
  }

  Widget textHaveAccount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?'),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (contex) {
                return LoginScreen();
              }));
            },
            child: Text(
              'LOGIN',
              style: TextStyle(color: Colors.yellow.shade900),
            ),
          )
        ],
      ),
    );
  }
}
