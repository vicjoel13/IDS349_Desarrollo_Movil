import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDice = 1;
  int rigtDice = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Dados de la suerte'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        leftDice = Random().nextInt(6) + 1;
                      });

                    },
                    child: Image.asset('images/dice$leftDice.png')),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        rigtDice = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset('images/dice$rigtDice.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
