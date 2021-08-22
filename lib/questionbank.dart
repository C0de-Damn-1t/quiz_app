import 'package:quizzer/questionclass.dart';
// ignore: unused_import
import 'main.dart';

class Questiobank{
    
   int _quenumber = 0;

   List<Question> _quebank = [
       Question(q:"1. C++ is faster than Python",a:"true"),
       Question(q:"2. String can be changed",a:"false"),
       Question(q:"3. C++ is case sensetive",a:"true"),
       Question(q:"4. Python is dynamic language",a:"true"),
       Question(q:"5. C is mid level language",a:"true"),
       Question(q:"6. unreal is a programming IDE",a:"false"),
       Question(q:"7. Orkut was establised after facebook",a:"false"),
       Question(q:"8. Numpy is written in c++",a:"true"),
       Question(q:"9. i++ is = i+2",a:"false"),
       Question(q:"10. Pandas are used for Data Handling",a:"true"),
  ];
   

  String getque(){
         return _quebank[_quenumber].question;    
  }

  String getans(){
         return _quebank[_quenumber].answer;
  }

  void reset(){
         _quenumber = 0;        

  }

  void next()
  {
    if(_quenumber<_quebank.length)
    _quenumber++;   
    else{
      print(_quenumber);
    }
  } 

  int givelength()
  {
    return _quebank.length;
  }

  int giveno()
  {
    return _quenumber;
  }
  
}