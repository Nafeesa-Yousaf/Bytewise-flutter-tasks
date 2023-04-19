import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String TaskName;
  final bool TaskCompleted;
  final Function(bool?)? onChanged; 
  final Function(BuildContext?)? onDelete;

  TodoTile({
    Key? key,
    required this.TaskName,
    required this.TaskCompleted,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
      padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: Row(
        children: [
          // CheckBox
          Checkbox(
            value: TaskCompleted, 
            onChanged: onChanged, 
            activeColor: Colors.amber,
          ),
          Text(
            TaskName,
            style: TextStyle(
              fontSize: 18,
              decoration: TaskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => onDelete?.call(context),
            icon: Icon(Icons.delete),
            alignment: Alignment.centerRight,
            color: Colors.amber,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(169, 0, 0, 0),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
