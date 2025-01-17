import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/todo_viewmodel.dart';

class TodoEdit extends StatefulWidget {
  final tododata;
  const TodoEdit({super.key, required this.tododata});

  @override
  State<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<TodoViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        title: const Text("TODO EDIT"),
      ),
      body: Form(
        key: formKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 380,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: todocontroller.titlecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Title",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 380,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: todocontroller.descriptioncontroller,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Description",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    todocontroller.editTodo(widget.tododata.sId);
                  }
                },
                child: Container(
                  width: 380,
                  height: 55,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
