import 'package:flutter/material.dart';
import 'package:quizzapp2/constants/constants.dart';
import 'package:quizzapp2/quiz_screen.dart';
import 'package:quizzapp2/start_screen.dart';
import 'package:quizzapp2/data/questions.dart';

import 'results_screen.dart';



class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  Widget? activeScreen;

  List<String> userAnswers = [];



  @override
  void initState() { //se ejecuta antes del build
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  //Metodo para cambiar a la pantalla QuizPage
  void switchScreen(){
    setState(() {
      activeScreen = QuizScreen(onSelectedAnswer: addAnswer);
    });
  }

  void addAnswer(String answer){
    userAnswers.add(answer);
    if(userAnswers.length == questions.length) {
      //Nos movemos a una nueva pagina de resultado
      setState(() {
        activeScreen = ResultsScreen(startQuiz: switchScreen, choosenAnswers: userAnswers,);
        userAnswers = [];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Container(
          decoration: kContainerStyle,
          child: activeScreen,
        ),
      ),
    );
  }
}

