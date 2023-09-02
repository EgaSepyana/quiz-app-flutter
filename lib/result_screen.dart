import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/components/circle.dart';
import 'package:quizz_app/data/questionDummy.data.dart';
import 'package:quizz_app/main_view.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.answers, required this.restartQuiz});

  final List<String> answers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getAnswerQuestion() {
    final List<Map<String, Object>> answersQuestion = [];

    for (var i = 0; i < answers.length; i++) {
      answersQuestion.add({
        "answer_index": i,
        "answer": dmmyQuestion[i].answer[0],
        "user_answer": answers[i],
        "question": dmmyQuestion[i].title,
      });
    }

    return answersQuestion;
  }

  @override
  Widget build(BuildContext context) {
    final answerQuestion = getAnswerQuestion();
    final totalAnswer = answerQuestion.length;
    final correctAnswer = getAnswerQuestion().where((e) {
      return e['user_answer'] == e['answer'];
    }).length;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 107, 15, 168),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Your answered $correctAnswer out of $totalAnswer question correctly!",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const PaddingInColumn(30),
              QuestionSummary(answer: answerQuestion),
              const PaddingInColumn(30),
              TextButton.icon(
                onPressed: restartQuiz,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                //   textStyle: const TextStyle(
                //     color: Colors.white,
                //   ),
                ),
                label: const Text("Restart Quiz!"),
                icon: const Icon(Icons.refresh),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.answer});

  final List<Map<String, Object>> answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: answer.map(
            (e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Circle(
                      text: ((e['answer_index'] as int) + 1).toString(),
                      isTrue: e['user_answer'] == e['answer']),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['question'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const PaddingInColumn(10),
                          Text(
                            e['user_answer'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 193, 88, 246),
                            ),
                          ),
                          const PaddingInColumn(5),
                          Text(
                            e['answer'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 106, 47, 241),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
