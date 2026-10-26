class QuizQuestionSpec {
  const QuizQuestionSpec({
    required this.promptKey,
    required this.optionKeys,
    required this.correctIndex,
  });

  final String promptKey;
  final List<String> optionKeys;
  final int correctIndex;
}

class QuizQuestion {
  const QuizQuestion({
    required this.prompt,
    required this.options,
    required this.correctIndex,
  });

  final String prompt;
  final List<String> options;
  final int correctIndex;
}

class MissionQuizBank {
  const MissionQuizBank(this.questions);

  final List<QuizQuestion> questions;

  int get length => questions.length;

  double scoreRatio(List<int?> answers) {
    if (questions.isEmpty) {
      return 0;
    }
    var correct = 0;
    for (var i = 0; i < questions.length; i++) {
      if (i < answers.length && answers[i] == questions[i].correctIndex) {
        correct++;
      }
    }
    return correct / questions.length;
  }
}
