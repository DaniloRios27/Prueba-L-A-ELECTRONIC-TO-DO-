import 'package:flutter/material.dart';

class AddActivityPage extends StatefulWidget {
  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {

  late TextEditingController _controller; 

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Actividad"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Actividad", 
                border: OutlineInputBorder(gapPadding: 3.0),
              ),
              controller: _controller,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(_controller.text),
              child: Text("Añadir")
            ),
          ],
        ),
      ),
    );
  }
}
