import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/repositories/todo_repository.dart';

class UpdateTodo {
  final TodoRepository todoRepository;

  UpdateTodo({required this.todoRepository});

  Future<void> call(TodoEntity todoEntity) async {
    todoRepository.updateTodoEntity(todoEntity);
  }
}
