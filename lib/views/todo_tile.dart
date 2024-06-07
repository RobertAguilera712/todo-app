import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent.shade700)
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // Checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged),
              // Task name
              Text(
                taskName,
                style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
