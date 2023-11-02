import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String text;
  TaskTile({required this.text});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void toggleCheckbox(bool? newValue) {
    setState(() {
      isChecked = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${widget.text}',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
        checkboxState: isChecked,
        toggleCheckboxState: toggleCheckbox,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final dynamic toggleCheckboxState;

  TaskCheckBox(
      {required this.checkboxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
