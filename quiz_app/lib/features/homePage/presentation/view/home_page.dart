import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/const/constants.dart';
import 'package:quiz_app/core/utils/utils.dart';
import 'package:quiz_app/features/homePage/data/models/question_model.dart';
import 'package:quiz_app/features/homePage/presentation/view/widgets/questions_body.dart';
import 'package:quiz_app/features/scoreScreen/presentation/view/score_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
List<QuestionModel> questions = Utils().questions;
int index=0;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: AppBar(title: const Text('Football Quiz'),centerTitle: true,backgroundColor: Colors.transparent,shadowColor: Colors.transparent, ),
        backgroundColor: const Color.fromARGB(255, 4, 37, 65),
    body: Center(
      child: QuestionView(
      questionTitle: questions[index].questionTitle,
      answers: questions[index].choices.keys.toList(),
      answersBoolValues: questions[index].choices.values.toList(),
      onpress: () {
        if(index< questions.length-1){
          
         setState(() {
           index++;
           isclicked=false;
         });
        }
        else{
         Navigator.push(context, MaterialPageRoute(builder: (context) => const ScoreScreen(),));
        }
      },)
      ),
    )
    );
  }
}