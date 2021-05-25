import 'package:flutter/material.dart';

class TodoInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  TodoInput({@required this.placeholder, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          labelText: placeholder,
        ),
      ),
    );
  }
}
