part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TodoEntity> allTodos;

  TodoLoadedState({required this.allTodos});
}

class TodoErrorState extends TodoState {}
