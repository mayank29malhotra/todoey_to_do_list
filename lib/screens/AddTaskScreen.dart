import 'package:flutter/material.dart';

final taskMessageController = TextEditingController();

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 32.0, left: 32.0, right: 32.0),
          child: Column(
            children: [
              SizedBox(height: 5.0),
              Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
              ),
              TextField(
                controller: taskMessageController,
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(
                  fillColor: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String message = taskMessageController.text.toString();
                    taskMessageController.clear();
                    Navigator.pop(context, message); // Pass the message to the main screen
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
