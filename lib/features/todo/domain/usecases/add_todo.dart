import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/domain/repositories/todo_repository.dart';

class AddTodo {
  final TodoRepository todoRepository;

  AddTodo({required this.todoRepository});

  Future<void> call(TodoEntity newTodoEntity) async {
    todoRepository.addTodoEntity(newTodoEntity);
  }
}
