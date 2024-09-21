part of 'todo_bloc.dart';

abstract class TodoEvent {}

class TodoGetAllEvent extends TodoEvent {}

class TodoAddEvent extends TodoEvent {
  final TodoEntity newTodoEntity;

  TodoAddEvent({required this.newTodoEntity});
}

class TodoDeleteEvent extends TodoEvent {
  final TodoEntity todoEntity;

  TodoDeleteEvent({required this.todoEntity});
}

class TodoUpdateEvent extends TodoEvent {
  final TodoEntity todoEntity;

  TodoUpdateEvent({required this.todoEntity});
}
