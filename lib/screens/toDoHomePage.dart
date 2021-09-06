import 'package:flutter/material.dart';
import 'package:to_do_app/screens/addActivityPage.dart';

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
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: (){},
            onTap: (){},
            child: ListTile(
              leading: Checkbox(
                onChanged: (checked) {
                  setState(() {
                    _todos[index].done = checked!;
                  });
                },
                value: _todos[index].done,
              ),
              title: Text(
                _todos[index].what,
                style: TextStyle(
                  decoration: (_todos[index].done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none)
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddActivityPage()
            ),
          ).then((what) {
            setState(() {
              _todos.add(ToDo(what));
            });
          });
        } ,
        child: Icon(Icons.add),

      ),
    );
  }
}
