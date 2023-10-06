import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/const/constants.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose(); 
    
    score=0;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(title: const Text('Score',),centerTitle: true,backgroundColor: Colors.transparent,shadowColor: Colors.transparent, ),
      backgroundColor: const Color.fromARGB(255, 4, 37, 65),
      body: Center(child: Container(
        height: 150,
        width: 250,
        decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(25)),
        child: Center(child: Text('Your Score is $score/6',style: const TextStyle(color: Colors.black,fontSize: 25,fontStyle: FontStyle.italic),))),),
    ));
  }
}