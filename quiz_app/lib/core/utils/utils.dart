import 'package:flutter/material.dart';
import 'package:quiz_app/features/homePage/data/models/question_model.dart';

 class Utils{
final correctAnswer = const Color.fromARGB(255, 27, 245, 34);
final wrongAnswer = const Color.fromARGB(255, 255, 18, 1);

List <QuestionModel> questions = [
  QuestionModel(
    id: 1, 
    questionTitle: 'Who won The World cup 1982 ?',
    choices: {'Argentina':false, 'Brazil':false , 'Italy': true, 'German':false}),

     QuestionModel(
     id: 2,
     questionTitle: "Ballon d'or winner 2006 ?",
     choices: {'Fabio Cnnavaro' : true, 'Ronaldinho': false , 'Kaka':false , 'Zidane': false }),

     QuestionModel(
     id: 3,
     questionTitle: "Premier league champion 1997 - 98 season ?",
     choices: {'Chelsea' : false, 'Man United': false , 'Arsenal':true , 'Man city': false }),

     QuestionModel(
     id: 4,
     questionTitle: "Who has scored the most goals for Croatia ?",
     choices: {'Mandzukic' : false, 'Modric': false , 'Simic':false , 'Suker': true }),

     QuestionModel(
     id: 5,
     questionTitle: "Champions league 2003/2004 top scorer ?",
     choices: {'Henry' : false, 'Drogba': false , 'Morrients':true , 'Brazilian Ronaldo': false }),

     QuestionModel(
     id: 6,
     questionTitle: "World cup 2022 Top scorer ?",
     choices: {'Messi' : false, 'Mbappe': true , 'Grizman':false , 'Harry kane': false }),





  
];
}



