import 'package:flutter/material.dart';
import 'package:quiz_app/features/homePage/presentation/view/home_Page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 37, 65),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome....',style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),
            const SizedBox(height: 30,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white
            ),
            onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
            }, child: Text('Start the quiz',style: TextStyle(color: Colors.black),))],
        ),
      ),
    ));
  }
}