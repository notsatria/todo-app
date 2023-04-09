import 'package:flutter/material.dart';

class ToDo {
  final String id;
  final String taskDesc;
  bool isChecked;

  ToDo({
    @required this.id,
    @required this.taskDesc,
    this.isChecked = false,
  });
}
