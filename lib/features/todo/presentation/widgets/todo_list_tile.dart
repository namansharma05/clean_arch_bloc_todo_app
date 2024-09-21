import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final TodoEntity todo;
  final TodoBloc todoBloc;
  const TodoListTile({super.key, required this.todo, required this.todoBloc});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            final todoEntity = TodoEntity(
                id: todo.id, title: todo.title, isCompleted: !todo.isCompleted);
            todoBloc.add(TodoUpdateEvent(todoEntity: todoEntity));
          }),
      title: Text(
        todo.title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
