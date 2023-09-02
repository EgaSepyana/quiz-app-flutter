import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/main_view.dart';
import 'package:quizz_app/data/questionDummy.data.dart';
import 'package:quizz_app/models/question.model.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelected});

  final void Function(String answer) onSelected;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  void changeQuestionIndex(String answer) {
    widget.onSelected(
      answer,
    );
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Question dummyQuestion = dmmyQuestion[questionIndex];

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
      child: Container(
        margin: const EdgeInsets.all(40),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                dummyQuestion.title,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const PaddingInColumn(30),
              ...dummyQuestion.getShuffled().map((e) {
                return AnswerButton(
                  answer: e,
                  onTap: () {
                    changeQuestionIndex(e);
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            backgroundColor: const Color.fromARGB(255, 15, 2, 103),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(
            answer,
            textAlign: TextAlign.center,
          )),
    );
  }
}
