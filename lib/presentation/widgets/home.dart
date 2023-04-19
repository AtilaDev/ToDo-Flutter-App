import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/presentation/providers/todo_provider.dart';
import 'package:todo_app/presentation/widgets/header.dart';
import 'package:todo_app/presentation/widgets/list_item.dart';
import 'package:todo_app/presentation/widgets/message_field_box.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    return Scaffold(
      appBar: const Header(title: 'Todo App'),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade300,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: todoProvider.items.length,
                  itemBuilder: (context, index) {
                    final item = todoProvider.items[index];

                    return Material(
                      color: Colors.white,
                      elevation: 1,
                      child: ListItem(
                        title: item.taskName,
                        dateText: DateFormat.yMd().format(item.date).toString(),
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              MessageFieldBox(onValue: todoProvider.addTodo),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
