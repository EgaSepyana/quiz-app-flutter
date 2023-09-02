import 'package:flutter/material.dart';
import 'package:quizz_app/data/questionDummy.data.dart';
import 'package:quizz_app/main_view.dart';
import 'package:quizz_app/quiz_screen.dart';
import 'package:quizz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = MainView(switchScreen);
  //   super.initState();
  // }

  void appendSelectedAnswer(answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == dmmyQuestion.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartQuiz() {
    selectedAnswer = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget currentScreen = MainView(switchScreen);

    if (activeScreen == 'question-screen') {
      currentScreen = QuestionsScreen(
        onSelected: appendSelectedAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      currentScreen = ResultScreen(
        answers: selectedAnswer,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: currentScreen,
        // body: activeScreen == 'start-screen' ? MainView(switchScreen) : const QuestionsScreen(),
      ),
    );
  }
}
