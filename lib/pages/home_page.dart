import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/view_models/todo_view_model.dart';
import 'package:todo_app/views/dialog_box.dart';
import 'package:todo_app/views/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          title: const Text("R Todo"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                final controller = TextEditingController();
                return DialogBox(
                  controller: controller,
                  onSave: (){
                    final name = controller.text.trim();
                    if (name.isNotEmpty){
                      viewModel.upsertTodo(Todo(name: name));
                      Navigator.of(context).pop();
                    }
                  },
                  onCancel: (){
                      Navigator.of(context).pop();
                  },
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: viewModel.todos.length,
          itemBuilder: (context, index) {
            final todo = viewModel.todos[index];
            return TodoTile(
              taskName: todo.name,
              taskCompleted: todo.isCompleted,
              onChanged: (value)  {
                todo.isCompleted = !todo.isCompleted;
                viewModel.upsertTodo(todo);
              },
              onDelete: (value) => {
                viewModel.deleteTodoById(todo.id)
              },
            );
          },
        ));
  }
}
