import "package:adv_basics/questions_screen.dart";
import "package:adv_basics/results_screen.dart";
import "package:flutter/material.dart";
import "package:adv_basics/start_screen.dart";
import 'package:adv_basics/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz ({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

   void switchScreen() {
     setState(() {
       selectedAnswers = [];
       activeScreen = "questions-screen";
     });
   }


   void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results screen";
      });
    }
    if (selectedAnswers.length >= questions.length) {
      return;
    }

   }

  @override
  Widget build (context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen"){
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}


