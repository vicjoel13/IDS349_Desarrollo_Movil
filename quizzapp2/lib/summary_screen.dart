import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({ required this.questionSummary, super.key});

  final List<Map<String, Object>> questionSummary;

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      questionSummary.map((data){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question ${(data['question_number'] as int) + 1}. ${data['question']}", style: GoogleFonts.lato(
                fontSize: 12,
                color: const Color.fromARGB(255, 224, 196, 252),
                fontWeight: FontWeight.bold)),
            Text("Your answer: ${data['user_answer']}", style: GoogleFonts.lato(
                fontSize: 12,
                color: const Color.fromARGB(255, 224, 196, 252),
                fontWeight: FontWeight.w500)),
            Text("Correct answer: ${data['correct_answer']}", style: GoogleFonts.lato(
                fontSize: 12,
                color: const Color.fromARGB(255, 224, 196, 252),
                fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 15,
            )
          ],
        );
      }).toList(),
    );
  }
}