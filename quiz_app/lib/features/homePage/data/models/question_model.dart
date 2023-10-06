class QuestionModel{
// create attributes of our question
 int id;
 String questionTitle;
 Map <String,bool> choices;

 // create its constructor
 QuestionModel({required this.id,required this.questionTitle,required this.choices});

}