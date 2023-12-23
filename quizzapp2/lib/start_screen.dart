import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/constants.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: kContainerStyle,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/quiz-logo.png',
              color: const Color.fromARGB(150, 255, 255, 255),
              width: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            Text('Learn Flutter The Fun Way',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 24)),
            const SizedBox(height: 30),
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 23, 1, 95)),
                onPressed: startQuiz,
                icon: const Icon(Icons.arrow_right_alt, color: Color.fromARGB(255, 224, 196, 252),),
                label: Text(
                  "Start",
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 224, 196, 252)),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
