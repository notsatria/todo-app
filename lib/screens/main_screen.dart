import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';
import '../constant/constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todolist = Provider.of<ToDoLists>(context);
    final alltodolist = todolist.toDoLists;

    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tdBGColor,
        leading: Icon(
          Icons.menu,
          size: 30,
          color: tdBlack,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: tdBGColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'All ToDos',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: alltodolist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 55,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: IconButton(
                            onPressed: () {
                              todolist.checkPressed(index);
                            },
                            icon: alltodolist[index].isChecked
                                ? Icon(
                                    Icons.check_box,
                                    color: tdBlue,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank,
                                    color: tdBlue,
                                  )),
                        title: Text(
                          alltodolist[index].taskDesc,
                          style: alltodolist[index].isChecked
                              ? TextStyle(
                                  decoration: TextDecoration.lineThrough)
                              : null,
                        ),
                        trailing: InkWell(
                          onTap: () {
                            todolist.deleteTodo(alltodolist[index].id);
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: tdRed,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 10),
                      padding: EdgeInsets.all(10),
                      width: 280,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 5),
                          ]),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add a new todo item'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        todolist.addToDoList(textController.text);
                        textController.clear();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15, bottom: 10),
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            color: tdBlue,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.black26,
                                  offset: Offset(0, 3)),
                            ]),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
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
