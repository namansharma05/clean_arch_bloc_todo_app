import 'package:clean_arch_bloc_todo_app/features/todo/data/models/todo_model.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:hive/hive.dart';

class TodoRepositoryImpl implements TodoRepository {
  final Box<TodoModel> todoBox;

  TodoRepositoryImpl({required this.todoBox});
  @override
  Future<void> addTodoEntity(TodoEntity newTodoEntity) async {
    await todoBox.put(newTodoEntity.id, TodoModel.fromEntity(newTodoEntity));
  }

  @override
  Future<void> deleteTodoEntity(TodoEntity todoEntity) async {
    await todoBox.delete(todoEntity.id);
  }

  @override
  Future<List<TodoEntity>> getAllTodoEntity() async {
    final result = await todoBox.values.map((todo) => todo.toEntity()).toList();
    return result;
  }

  @override
  Future<void> updateTodoEntity(TodoEntity todoEntity) async {
    await todoBox.put(todoEntity.id, TodoModel.fromEntity(todoEntity));
  }
}
