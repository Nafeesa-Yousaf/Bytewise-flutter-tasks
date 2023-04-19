import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/database.dart';
import '../util/Dialogue_box.dart';
import '../util/todo_tile.dart';
class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final _mybox=Hive.box('mybox');

  //Text Controller
  final _controller= TextEditingController();

TodoDataBase db= TodoDataBase();
@override
  void initState() {
    //if app run for first time default data is appear
    if(_mybox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      //not for first time,already data is stored
      db.LoadData();
    }
    super.initState();
  }

  //Checkbox Tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.UpdateDate();
  }

//save Task
void saveTask(){
  setState(() {
    db.TodoList.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.UpdateDate();
}

//create new task
void createnewTask(){
  showDialog(context: context, builder: (context){
    return DialogBox(
      controller: _controller ,
      onSave: saveTask,
      oncancel: ()=>Navigator.of(context).pop(),
    );
  }
  );
}

//Delete Task
void deleteTask(int index){
setState(() {
  db.TodoList.removeAt(index);
});
db.UpdateDate();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: TextStyle(fontSize: 30, color: Colors.black, fontFamily: 'Arial'),
        ),
        backgroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView.builder(
            itemCount: db.TodoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                  TaskName: db.TodoList[index][0],
                  TaskCompleted: db.TodoList[index][1],
                  onChanged: (value) => checkboxChanged(value, index),
                  onDelete:(context) => deleteTask(index),);
            },
          ),
          
        ),
      ),
    );
  }
}

