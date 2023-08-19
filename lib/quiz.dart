import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/questions_screen.dart';
import 'package:untitled2/start_screen.dart';
import 'package:untitled2/results_screen.dart';

import 'data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var selectedAnswers = <String>[];
  var  activeScreen ='start-screen';
  /*@override
  void initState() {
    super.initState();
    activeScreen = StartScreen(SwitchScreen) as String;
  }*/

  void SwitchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void chooseAnswer (String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';

      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget  screenWidget = StartScreen(SwitchScreen);
    if(activeScreen == 'questions-screen' ){
      screenWidget = QuestionsScreen(
          onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      )
;     }
     return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 51),
                Color.fromARGB(255, 107, 15, 168),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<Widget?>(
            'activeScreen',
            activeScreen as Widget?
        )
    );
  }
}

