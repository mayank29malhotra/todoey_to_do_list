import 'package:flutter/material.dart';
import 'TaskTile.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.getTask(index);
            return GestureDetector(
              onLongPress: () {
                // Handle the long press event here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Long Pressed Item'),
                      content: Text('You want to Delete the Task ?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                        TextButton(
                          onPressed: () {
                            taskData.deleteTask(index);
                            Navigator.of(context).pop();
                          },
                          child: Text('Delete'),
                        ),

                      ],
                    );
                  },
                );
              },
              child: TaskTile(text: task.name),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
