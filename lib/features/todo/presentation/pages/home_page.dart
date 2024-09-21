import 'package:clean_arch_bloc_todo_app/features/todo/data/models/todo_model.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/presentation/widgets/todo_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: _appBar(),
      body: _body(todoBloc),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context, todoBloc),
        child: Icon(Icons.add),
      ),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Todo App'),
      elevation: 10,
      surfaceTintColor: Colors.black,
      shadowColor: Colors.grey.shade900,
      titleTextStyle: const TextStyle(fontSize: 22, color: Colors.white70),
      backgroundColor: Colors.black,
    );
  }

  _body(todoBloc) {
    return SizedBox(
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is TodoLoadedState) {
            return ListView.builder(
              itemCount: state.allTodos.length,
              itemBuilder: (context, index) {
                final todo = state.allTodos[index];
                return TodoListTile(todo: todo, todoBloc: todoBloc);
              },
            );
          } else if (state is TodoErrorState) {
            return const Center(
              child: Text('Error occured'),
            );
          } else {
            return const Center(
              child: Text('Add Todo item'),
            );
          }
        },
      ),
    );
  }

  _dialogBuilder(context, todoBloc) {
    final textFiledController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: textFiledController,
            decoration: const InputDecoration(
              hintText: 'Enter title',
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add'),
              onPressed: () async {
                final todoBox = await Hive.openBox<TodoModel>('todoBox');
                final idList = (todoBox.values.map((todo) => todo.id)).toList();
                final newTodoEntity = TodoEntity(
                    id: idList.isEmpty ? 1 : idList[idList.length - 1] + 1,
                    title: textFiledController.text,
                    isCompleted: false);
                todoBloc.add(TodoAddEvent(newTodoEntity: newTodoEntity));
                textFiledController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
