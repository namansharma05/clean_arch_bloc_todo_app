import 'dart:async';

import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/add_todo.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/get_all_todos.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/update_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  TodoBloc(this.todoRepository) : super(TodoInitial()) {
    on<TodoGetAllEvent>(todoGetAllEvent);
    on<TodoAddEvent>(todoAddEvent);
    on<TodoUpdateEvent>(todoUpdateEvent);
    on<TodoDeleteEvent>(todoDeleteEvent);
  }

  FutureOr<void> todoGetAllEvent(
      TodoGetAllEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoadingState());
    final todos = await GetAllTodos(todoRepository: todoRepository).call();
    emit(TodoLoadedState(allTodos: todos));
  }

  Future<void> todoAddEvent(TodoAddEvent event, Emitter<TodoState> emit) async {
    await AddTodo(todoRepository: todoRepository).call(event.newTodoEntity);
    add(TodoGetAllEvent());
  }

  Future<void> todoUpdateEvent(
      TodoUpdateEvent event, Emitter<TodoState> emit) async {
    await UpdateTodo(todoRepository: todoRepository).call(event.todoEntity);
    add(TodoGetAllEvent());
  }

  Future<void> todoDeleteEvent(
      TodoDeleteEvent event, Emitter<TodoState> emit) async {
    await DeleteTodo(todoRepository: todoRepository).call(event.todoEntity);
    add(TodoGetAllEvent());
  }
}
