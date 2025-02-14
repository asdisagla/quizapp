import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget {
  //const StartScreen(void Function() startQuiz, {super.key});

  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(context){
    return Center(
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Opacity(
                  //opacity: 0.5 ,
                Image.asset(
                    "assets/images/quiz-logo.png",
                    width: 300,
                    color: Colors.white,

                ),
                const SizedBox(height: 80),
                 Text(
                    "Learn Flutter",
                  style:GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                  ),
                ),

                    const SizedBox(height: 30),
                    OutlinedButton.icon(
                      onPressed: startQuiz,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.arrow_right_alt),
                      label: const Text("Start Quiz"),
                  ),
              ],
            ),
        ),
    );
  }

}