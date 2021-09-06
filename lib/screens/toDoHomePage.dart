import 'package:flutter/material.dart';


class ToDo {
  
  String what;
  bool done;

  ToDo(this.what) : done = false;
}

class ToDoHomePage extends StatefulWidget {
@override
  _ToDoHomePageState createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  
  late List<ToDo> _todos;

@override 
  void initState() {
    _todos = [
      ToDo("Primero"),
      ToDo("Segunda"),
      ToDo("Tercero"),
    ];
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Checkbox(
                onChanged: (checked){
                  setState(() {
                    _todos[index].done = checked!;
                  });
                },
                value: _todos[index].done,
              ),
              title: Text(_todos[index].what),
            );
          },
      ),
    );
  }
}