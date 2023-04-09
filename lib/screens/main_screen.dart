import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo_provider.dart';
import '../constant/constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final textInputController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<ToDoLists>(context, listen: false);

    final alltodoList = todoList.toDoLists;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        backgroundColor: tdBGColor,
      ),
      body: Container(
        height: double.infinity,
        color: tdBGColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: tdBlack,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'All ToDos',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: alltodoList.length,
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 55,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        alltodoList[index].isChecked =
                            !alltodoList[index].isChecked;
                      });
                    },
                    leading: alltodoList[index].isChecked
                        ? Icon(
                            Icons.check_box,
                            size: 24,
                            color: tdBlue,
                          )
                        : Icon(
                            Icons.check_box_outline_blank,
                            size: 24,
                            color: tdBlue,
                          ),
                    title: Text(
                      alltodoList[index].taskDesc,
                      style: alltodoList[index].isChecked
                          ? TextStyle(decoration: TextDecoration.lineThrough)
                          : null,
                    ),
                    trailing: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: tdRed,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            todoList.removeToDo(alltodoList[index].id);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      width: 270,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 5),
                          ]),
                      child: TextField(
                        controller: textInputController,
                        onSubmitted: (value) {
                          textInputController.clear();
                        },
                        decoration: InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // menambahkan list baru
                        setState(() {
                          todoList.addNewToDo(textInputController.text);
                          textInputController.clear();
                        });
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: tdBlue,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  offset: Offset(0, 3)),
                            ]),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
