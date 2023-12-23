import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;


  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //Atributo para controlar el numero de pregunta

  int questionNumber = 0;

  //Funcion para pasar a la siguiente pregunta
  void nextQuestion(String selectedAnswer){
    setState(() {
      widget.onSelectedAnswer(selectedAnswer);
      questionNumber++;
    });
  }


  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionNumber];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 224, 196, 252),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map(
                    (answer){
                  return AnswerButton(text: answer,
                    onTap: () {
                      nextQuestion(answer);
                    } ,
                  );
                })
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  AnswerButton({super.key, required this.text, required this.onTap});

  String text;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 23, 1, 95),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onTap,
          child: Text(
            text,
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251)),
            textAlign: TextAlign.center,
          )),
    );
  }
}
