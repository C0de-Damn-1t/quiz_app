import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'questionbank.dart';
// ignore: unused_import
import 'package:rflutter_alert/rflutter_alert.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          backgroundColor: Colors.purple[600],
          title: Center(
            child: Text(
              "Quizzer"
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: body(),
          )
        ),
      ),

    );
  }
}

class body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override 
  int R = 0;
  int W = 0;
  List<Icon> mylist = [];  
  Questiobank quebnk = Questiobank();    
  String answer = "";

  Widget build(BuildContext context) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     crossAxisAlignment: CrossAxisAlignment.stretch,
     children: <Widget>[
       Expanded(
         flex:5,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10.0),
           child: Center(
             child: Text(
                quebnk.getque(),
                style: TextStyle(
                 color: Colors.white,
                 fontSize: 50.0,
                 fontFamily:'Georgia',
                ) ,
             ),
           ),
         ),
       ),
       Expanded(
        child:Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(            
            onPressed: ()
            {
              setState(() {                                
                 answer = "true";
                 if (answer == quebnk.getans())
                 {
                   R++;
                   mylist.add(
                     Icon(
                       Icons.check,
                       color:Colors.green,
                     )
                   );                   
                 }
                 else{
                   W++;
                   mylist.add(
                     Icon(
                       Icons.close,
                       color:Colors.red,
                     )
                   );                 
                 } 
                  quebnk.next();
                  if (quebnk.giveno()==quebnk.givelength())
                  {
                    Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'Right:$R,Wrong:$W.',
                    ).show();
                    quebnk.reset();
                    mylist =[];
                    R=0;
                    W=0;
                  }                                  
                });
              },
            color: Colors.green,
            child: Text(
              "True",
              style:TextStyle(
                fontSize: 20,
                color: Colors.white
              )
            ),
          ),
        )
      ),
       Expanded(
        child:Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            onPressed: ()
            {
              setState(() { 
                                
              answer = "false";
                 if (answer == quebnk.getans())
                 {
                   R++;
                   mylist.add(
                     Icon(
                       Icons.check,
                       color:Colors.green,
                     )
                   );                   
                 }
                 else{
                   W++;
                   mylist.add(
                     Icon(
                       Icons.close,
                       color:Colors.red,
                     )
                   );                 
                 } 
                 quebnk.next();  
                 if (quebnk.giveno()==quebnk.givelength())
                  {
                    Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'Right:$R,Wrong:$W.',
                    ).show();
                    quebnk.reset();
                    mylist =[];
                    R=0;
                    W=0;
                  }           
              });                         
            },
            color: Colors.red,
            child: Text(
              "False",
              style:TextStyle(
                fontSize: 20,
                color: Colors.white
              )
            ),
          ),
        )
      ),
      Row(
        children: mylist,
      ),  
     ],
   );
  }

  // ignore: non_constant_identifier_names
  Alert({BuildContext context, String title,  String desc}) {}
}
