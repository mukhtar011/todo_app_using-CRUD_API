import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_withcrud_api/src/view/todo_list.dart';
import 'package:todo_app_withcrud_api/src/view_model/todo_viewmodel.dart';

import 'helper/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoViewModel>(
            create: (_) => TodoViewModel(NavigationService.instance))
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green,
        ),
        home: const TodoList(),
      ),
    );
  }
}
