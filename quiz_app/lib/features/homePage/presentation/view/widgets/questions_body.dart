import 'package:flutter/material.dart';
import 'package:quiz_app/features/homePage/presentation/view/widgets/answer.dart';

class QuestionView extends StatefulWidget {
   const QuestionView({super.key,required this.questionTitle,required this.answers,required this.onpress,required this.answersBoolValues});
    final String questionTitle;
    final List<String> answers;
    final void Function()? onpress;
    final List<bool> answersBoolValues;
  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
        slivers: [
          SliverToBoxAdapter(

            
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  
                  children: [
                    const SizedBox(height: 100,),
            Container(
              constraints: BoxConstraints(maxHeight: 80,maxWidth: MediaQuery.of(context).size.width * 0.85,),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Center(child: Text(widget.questionTitle,style:const TextStyle(color: Colors.black),)) ,
            ),
            const SizedBox(height: 7,),
                   const Divider(),
                  const SizedBox(height: 7,),
                  CustomAnswer(
                    answers: widget.answers,
                    answersBoolValues: widget.answersBoolValues),
                  const SizedBox(height: 35,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    ),
                    onPressed: widget.onpress,
                     child: const Text('Next Question',style: TextStyle(color: Colors.black),))
                   
                  ],
                ),
          ),]
    );
  }
}