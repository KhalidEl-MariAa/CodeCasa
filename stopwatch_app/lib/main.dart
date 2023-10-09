

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home:const Homepage()
    );
    
    }
    }

    class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
double startTime =0;
double endtome=0; 
List<double> difference = [];
final StopWatchTimer stopWatchTimer = StopWatchTimer(
  mode: StopWatchMode.countUp,

);
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Color(0Xff355C7D),Colors.blueGrey,Color(0xffC06C84)])
            ),
          child: CustomScrollView(
            slivers: [SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text('Stopwatch',style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
                   SizedBox(height: (MediaQuery.of(context).size.height-150)*0.40,),
                  StreamBuilder(
                  stream: stopWatchTimer.rawTime,
                  initialData: stopWatchTimer.rawTime.value ,
                   builder: (context, snapshot) {
                    final value = snapshot.data;
                    final displaytime = StopWatchTimer.getDisplayTime(value!,hours: true,milliSecond: false) ;
                    return  Text(displaytime,style:const TextStyle(fontSize: 50,fontStyle: FontStyle.italic));
                   },),
                    difference.isEmpty?const SizedBox(): Padding(
                      padding: const EdgeInsets.only(left: 130 ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                            itemCount: difference.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (difference[index]<60000){
                              return Text('Time diffderence is ${(difference[index]/1000).ceil()} sec..');
                              }
                              else if (difference[index]>60000 && difference[index]<3600000 ){
                               return Text('Time difference is ${(difference[index]/6000).ceil()} min.'); 
                              }
                              else{
                                return Text('Time difference is ${(difference[index]/3600000).ceil()} hou.'); 
                              }
                              },
                            ),
                    ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(125, 50),
                          backgroundColor:const Color.fromARGB(255, 128, 64, 184),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25))
                          )
                        ),
                        onPressed: (){
                          startTime = stopWatchTimer.rawTime.value.toDouble();
                         stopWatchTimer.onStartTimer();
                        }, 
                      child: const Text('Start',style: TextStyle(color: Colors.white),)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(125, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25))
                          )
                        ),
                        onPressed: (){
                          endtome=stopWatchTimer.rawTime.value.toDouble();
                        stopWatchTimer.onStopTimer();
                        if(endtome!=0){
                          setState(() {
                            var diff = (endtome-startTime);
                             difference.add(diff);
                          });
                          
                        }
                        }, 
                      child: const Text('Stop',style: TextStyle(color: Colors.black)))
                    ],
                  ),
                  const SizedBox(height: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 223, 25, 11),
                          fixedSize: const Size(150, 50),
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25) 
                          )
                        ),
                        onPressed: (){
                           
                        stopWatchTimer.onResetTimer();
                         if(difference.isNotEmpty){
                          setState(() {
                            difference.clear();
                          });
                          }
                        }, 
                      child: const Text('Reset',style: TextStyle(color: Colors.black),))
                      
                      
                ],
              ),
            ),]
          ),
        ),
      ),
    );
  }
}