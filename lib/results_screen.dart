
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers,required this.onRestart});
});

  final List<String> chosenAnswers;
  final VoidCallback onRestart;

  List<Map<String, Object >> getSummaryData(){
    final List<Map<String, Object>> summary =[];

    for(var i =0; i< chosenAnswers.length; i++){
      // loop body
      summary.add(
        {
          "question_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": chosenAnswers[i]
        },
      );
    }
    print("Summary Data: $summary");
    return summary;
  }


  @override
  Widget build(BuildContext context, dynamic texAlign) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data["user_answer"]== data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("you answered $numCorrectQuestions out of $numTotalQuestions "
                "questions "
                "correctly!",
            textAlign: TextAlign.center,style: GoogleFonts.lato(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
               ),
             ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              child: const Text("restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}

