import 'package:flutter/material.dart';
import 'package:todo_app/views/dialog_box.dart';
import 'package:todo_app/views/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    {"name": "Make tutorial", "value": false},
    {"name": "Make food", "value": false},
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index]["value"] = !toDoList[index]["value"];
    });
  }

  void onSaveTask() {
    setState(() {
      toDoList.add({"name": _controller.text, "value": false});
      _controller.clear();
    });
    Navigator.pop(context);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: onSaveTask,
          onCancel: onCancel,
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          title: Text("TODO"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add, color: Colors.white,),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: toDoList[index]["name"],
                taskCompleted: toDoList[index]["value"],
                onChanged: (value) => checkboxChanged(value, index),
                onDelete:(value) => deleteTask(index),
                );
          },
        ));
  }
}
