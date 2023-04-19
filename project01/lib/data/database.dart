import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
  List TodoList=[

  ];
  final _mybox=Hive.box('mybox');

//when app open first time
  void createInitialData(){
   TodoList = [ 
       ['No Task Yet', false],
  ];
  }

  //load data from database
  void LoadData(){
       TodoList = _mybox.get("TODOLIST");
  }

  // update database
  void UpdateDate(){
    _mybox.put("TODOLIST",TodoList);
  }
}