import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView(this.startQuiz ,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              //Opacity
              color: const Color.fromARGB(150, 255, 255, 255),
              // opacity: const AlwaysStoppedAnimation(.7),
            ),
            // Opacity(
            //   opacity: 0.5,
            //   child: Image.asset(
            //     'assets/images/quiz-logo.png',
            //     width: 300,
            //   ),
            // ),
            const PaddingInColumn(60),
            const Text(
              "Learn Flutter is the fun way!",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const PaddingInColumn(20),
            OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text("Start Quizz"))
          ],
        ),
      ),
    );
  }
}

class PaddingInColumn extends StatelessWidget {
  const PaddingInColumn(this.height, {super.key});

  final double height;
  @override
  Widget build(context) {
    return SizedBox(height: height);
  }
}
