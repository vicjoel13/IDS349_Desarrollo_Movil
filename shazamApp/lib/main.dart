import 'package:shazamapp/pages/login/login_page.dart';
import 'package:shazamapp/pages/register/register_page.dart';
import 'package:shazamapp/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor, brightness: Brightness.light)
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage()
      },
    );
  }
}
