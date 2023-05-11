


import 'package:flutter/material.dart';
   import 'package:quiz_app/Quiz_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

    class QuizApp extends StatefulWidget {
    const QuizApp({Key? key}) : super(key: key);

   @override
   State<QuizApp> createState() => _QuizAppState();
 }

 class _QuizAppState extends State<QuizApp> {
   TextStyle styles=TextStyle(color: Colors.white,fontSize: 20);
   int count=0;
   int qnumber=0;

   List<Icon>Ico=[];

  List Quizlist=[
    Quizmodel(question: "sky is blue",answer:true),
    Quizmodel(question: "Sunflower has seeds",answer: true),
    Quizmodel(question: "Ant is biggest", answer: false),
    Quizmodel(question: "Humans can fly", answer: false),
    Quizmodel(question: "lions can roar", answer: true),
    Quizmodel(question: "Camel has humps", answer: true),
    Quizmodel(question: "Snake has tails", answer: false),
    Quizmodel(question: "Apple is red in color",answer:true),
    Quizmodel(question: "Orange is a vegetable",answer: false),
    Quizmodel(question: "Sea is endless", answer: true),
  ];
  @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
       body: Column(
       mainAxisAlignment: MainAxisAlignment.end,
         children:[

           Padding(
             padding: const EdgeInsets.only(bottom: 280),
             child: Text(getquestions(),style: styles),
           ),
           SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: MediaQuery.of(context).size.height/13,
               width: MediaQuery.of(context).size.width/1,
               child: ElevatedButton(onPressed: (){
                 check(true);


               },
                   style: ElevatedButton.styleFrom(
                     primary: Colors.green,
                   ),
                   child: Text("True",style: styles,)),
             ),
           ),
           SizedBox(height: 30,),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               height: MediaQuery.of(context).size.height/13,
               width: MediaQuery.of(context).size.width/1,
               child: ElevatedButton(onPressed: (){
                 check(false);

               },
                   style: ElevatedButton.styleFrom(
                     primary: Colors.red,
                   ),
                   child: Text("False",style: styles),
             ),
             ),
           ),

           Row(
             children: Ico,
           ),

         ]
       ),
     );
   }

   String getquestions(){
    return Quizlist[qnumber].question;
  }
  bool getanswers(){
    return Quizlist[qnumber].answer;
  }
  void nextquestion(){
    if(qnumber<Quizlist.length){
      qnumber++;
    }
  }

 int reset(){
    qnumber=0;
    return qnumber;
  }
  bool finish(){
    if(qnumber>=Quizlist.length-1){
      return true;
    }
    else{
      return false;
    }
   }

   void check( bool answer){
    bool value=getanswers();
    setState(() {
      if(finish()==true){
        if(count<=4) {
          Alert(
            context: this.context,

            title: "Game Over",
            desc: "oops! you failed",
            buttons: [
              DialogButton(
                child: Text(
                  "cancel",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushReplacement(this.context,
                      MaterialPageRoute(builder: (context) => QuizApp()));
                },

                width: 120,
              )
            ],
          ).show();
        }
          else{
          Alert(
            context:this.context ,

            title: "Game Over",
            desc: "Congratulations! you won",
            buttons: [
              DialogButton(
                child: Text(
                  "cancel",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context)=>QuizApp()));
                },

                width: 120,
              )
            ],
          ).show();

        }

        }





else{
  if(value==answer){
    count++;  //
   Ico.add(Icon(Icons.check,color: Colors.green,));
  }
  else{
    Ico.add(Icon(Icons.close,color: Colors.red,));
  }
  nextquestion();
      }


    });

   }

 }
