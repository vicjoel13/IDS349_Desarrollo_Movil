import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "data/questions.dart";
import "summary_screen.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.startQuiz, required this.choosenAnswers});

  final Function() startQuiz;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_number': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((element) {
      return element['user_answer'] == element['correct_answers'];
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You Answered $numCorrectAnswers of $numTotalQuestions questions correctly',
                style: GoogleFonts.lato(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 201, 153, 251),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Column(
                children: [
                  // Desplegar summary
                  SummaryScreen(questionSummary: summaryData),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 201, 153, 251),
                        backgroundColor: const Color.fromARGB(255, 23, 1, 95)),
                    onPressed: startQuiz,
                    label: Text(
                      'Restart Quiz',
                      style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 224, 196, 252)),
                    ),
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Color.fromARGB(255, 224, 196, 252),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
