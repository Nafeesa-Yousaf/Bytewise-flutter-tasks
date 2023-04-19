import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback oncancel;
   DialogBox({super.key,required this.controller,
  required this.onSave, required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Add Task',
                labelStyle: TextStyle(color: Colors.amber),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onSave,
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.black,
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: oncancel,
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
