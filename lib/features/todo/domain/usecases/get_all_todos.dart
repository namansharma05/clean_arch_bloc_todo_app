import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/repositories/todo_repository.dart';

class GetAllTodos {
  final TodoRepository todoRepository;

  GetAllTodos({required this.todoRepository});

  Future<List<TodoEntity>> call() {
    return todoRepository.getAllTodoEntity();
  }
}
