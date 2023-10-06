import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/const/constants.dart';
import 'package:quiz_app/core/utils/utils.dart';


class CustomAnswer extends StatefulWidget {
  const CustomAnswer({super.key,required this.answers,required this.answersBoolValues});
  final List<String> answers;
  final List<bool> answersBoolValues;
   

  @override
  State<CustomAnswer> createState() => _CustomAnswerState();
}



class _CustomAnswerState extends State<CustomAnswer> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.answers.length,
       separatorBuilder: (context, index) => const SizedBox(height: 20,),
      itemBuilder:(context, index) =>  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isclicked= true;
            });
            if(widget.answersBoolValues[index]==true){
                score++;
                print(score);
            }
            else{

            }
            
          },
          child: Container(
              constraints: BoxConstraints(maxHeight: 80,maxWidth: MediaQuery.of(context).size.width * 0.85,),
              decoration: BoxDecoration(
                color: isclicked? widget.answersBoolValues[index]==false?Utils().wrongAnswer:Utils().correctAnswer: Colors.black ,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Center(child: Text(widget.answers[index],)) ,
            ),
        ),
      ),);
  }
}