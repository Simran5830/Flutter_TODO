// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?) onChanged;
  final Function (BuildContext)? deleteFunction;
  final Function ()? onEdit;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [SlidableAction(onPressed: deleteFunction,
      icon: Icons.delete, backgroundColor: Colors.red.shade300,
      )]),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 119, 91, 5),),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
            ),
            Text(taskName, style: TextStyle(decoration: taskCompleted? TextDecoration.lineThrough: TextDecoration.none),),
             Spacer(),
             ElevatedButton(onPressed: onEdit,
                  child: Icon(Icons.edit)),         
          ],
        ),
      ),
    );
  }
}
