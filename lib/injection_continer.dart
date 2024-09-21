import 'package:clean_arch_bloc_todo_app/features/todo/data/models/todo_model.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/add_todo.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/get_all_todos.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/usecases/update_todo.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // hive injection
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TodoModelAdapter());
  final todoBox = await Hive.openBox<TodoModel>('todoBox');

  // repositories injection
  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(todoBox: todoBox));

  // use cases injection
  getIt.registerLazySingleton(() => GetAllTodos(todoRepository: getIt()));
  getIt.registerLazySingleton(() => AddTodo(todoRepository: getIt()));
  getIt.registerLazySingleton(() => UpdateTodo(todoRepository: getIt()));
  getIt.registerLazySingleton(() => DeleteTodo(todoRepository: getIt()));

  // bloc injection
  getIt.registerFactory(
    () => TodoBloc(getIt()),
  );
}
