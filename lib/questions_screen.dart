import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/answer_button.dart';
import 'package:untitled2/data/question.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectAnswer) {
    widget.onSelectAnswer(selectAnswer);
    //currentQuestionIndex  = currentQuestionIndex +1;
    //currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });

  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
       child: Container(
         margin: const EdgeInsets.all(40),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 253),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,


                ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30, ),
          ...currentQuestion.getShuffledAnswers().map((answer)   {
            return AnswerButton(
                answerText: answer,
                onTop: () {
                  answerQuestion(answer);
                }
            );
          })

          ],
      ),
       ),
    );
  }
}
