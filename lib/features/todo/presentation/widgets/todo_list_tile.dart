import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final TodoEntity todo;
  final TodoBloc todoBloc;
  const TodoListTile({super.key, required this.todo, required this.todoBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        tileColor: Colors.grey.shade500,
        leading: Checkbox(
            activeColor: Colors.grey.shade700,
            value: todo.isCompleted,
            onChanged: (value) {
              final todoEntity = TodoEntity(
                  id: todo.id,
                  title: todo.title,
                  isCompleted: !todo.isCompleted);
              todoBloc.add(TodoUpdateEvent(todoEntity: todoEntity));
            }),
        title: Text(
          todo.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: Colors.black,
            decorationThickness: 3,
          ),
        ),
        trailing: IconButton(
            onPressed: () {
              todoBloc.add(TodoDeleteEvent(todoEntity: todo));
            },
            icon: const Icon(
              CupertinoIcons.delete_simple,
              color: Colors.black,
            )),
      ),
    );
  }
}
