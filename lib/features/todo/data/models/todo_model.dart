import 'package:clean_arch_bloc_todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  TodoEntity toEntity() {
    return TodoEntity(id: id, title: title, isCompleted: isCompleted);
  }

  factory TodoModel.fromEntity(TodoEntity todo) {
    return TodoModel(
        id: todo.id, title: todo.title, isCompleted: todo.isCompleted);
  }
}
