import 'package:isar/isar.dart';

part 'todo.g.dart';


@Collection()
class Todo {
  Id id = Isar.autoIncrement;
  late String name;
  late bool isCompleted;

  Todo({required this.name, this.isCompleted = false});
}
