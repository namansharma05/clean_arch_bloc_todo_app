import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getAllTodoEntity();
  Future<void> addTodoEntity(TodoEntity newTodoEntity);
  Future<void> updateTodoEntity(TodoEntity newTodoEntity);
  Future<void> deleteTodoEntity(TodoEntity newTodoEntity);
}
