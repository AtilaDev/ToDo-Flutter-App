import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/presentation/providers/todo_provider.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String dateText;
  final int index;
  const ListItem({
    super.key,
    required this.title,
    required this.dateText,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(dateText),
          trailing: IconButton(
            onPressed: () {
              todoProvider.deleteTodo(index);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
