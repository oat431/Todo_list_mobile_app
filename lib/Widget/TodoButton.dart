import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  Function whenSubmit;
  String buttonLabel;

  TodoButton({this.whenSubmit, this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: whenSubmit,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.purple.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.purple.shade200,
      textColor: Colors.white,
      padding: const EdgeInsets.all(14.0),
      child: Text(buttonLabel),
    );
  }
}
