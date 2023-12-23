class QuizModel{
  QuizModel(this.question, this.answers);

  String question;
  List<String> answers = [];

  List<String> getShuffledAnswers() {
    //Copiar la lista original de respuestas
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

}