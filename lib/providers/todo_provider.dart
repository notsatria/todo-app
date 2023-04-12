import 'package:flutter/material.dart';

import '../models/todo.dart';

class ToDoLists with ChangeNotifier {
  final List<ToDo> _toDoLists = [
    ToDo(
      id: 'id1',
      taskDesc: 'Menyapu',
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

  void checkPressed(int index) {
    toDoLists[index].isChecked = !toDoLists[index].isChecked;
    notifyListeners();
  }

  void addToDoList(String taskDesc) {
    _toDoLists.add(
      ToDo(id: DateTime.now().toString(), taskDesc: taskDesc),
    );
    notifyListeners();
  }

  void deleteTodo(String id) {
    _toDoLists.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
