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

  static List<ToDo> todoList() {
    return [
      ToDo(
        id: 'id1',
        taskDesc: 'Afa iyah',
        isChecked: true,
      ),
      ToDo(
        id: 'id2',
        taskDesc: 'Belajar',
        isChecked: true,
      ),
      ToDo(
        id: 'id3',
        taskDesc: 'Mengepel',
        isChecked: false,
      ),
      ToDo(
        id: 'id4',
        taskDesc: 'Jogging',
        isChecked: true,
      ),
      ToDo(
        id: 'id5',
        taskDesc: 'Sekolah',
        isChecked: false,
      ),
    ];
  }
}

class ToDoLists {
  final List<ToDo> _toDoLists = [
    ToDo(
      id: 'id1',
      taskDesc: 'Menggambar',
      isChecked: false,
    ),
    ToDo(
      id: 'id2',
      taskDesc: 'Belajar',
      isChecked: true,
    ),
    ToDo(
      id: 'id3',
      taskDesc: 'Mengepel',
      isChecked: false,
    ),
    ToDo(
      id: 'id4',
      taskDesc: 'Jogging',
      isChecked: true,
    ),
    ToDo(
      id: 'id5',
      taskDesc: 'Sekolah',
      isChecked: false,
    ),
  ];

  List<ToDo> get toDoLists {
    return [..._toDoLists];
  }
}
