import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/todo_viewmodel.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<TodoViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: const Text("TODO LIST")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todocontroller.navigateToCreate();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: todocontroller.allTodos.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.green,
                    title:
                    Text(todocontroller.allTodos[i].todoTitle.toString()),
                    subtitle: Text(
                        todocontroller.allTodos[i].todoDescription.toString()),
                    trailing: PopupMenuButton(
                      child: const Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text("EDIT"),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text("DELETE"),
                        )
                      ],
                      onSelected: (String value) {
                        if (value == "edit") {
                          todocontroller
                              .navigateToEdit(todocontroller.allTodos[i]);
                        }
                        if (value == "delete") {
                          todocontroller.deleteTodo(
                              todocontroller.allTodos[i].sId.toString(), i);
                        }
                      },
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
