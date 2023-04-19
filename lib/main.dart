import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/presentation/providers/todo_provider.dart';
import 'package:todo_app/presentation/widgets/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
