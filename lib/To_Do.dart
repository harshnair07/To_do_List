import 'package:flutter/material.dart';
import 'package:to_do/Todo_itme.dart';
import 'package:to_do/todo.dart';

class TODO extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TODOstate();
  }
}

class _TODOstate extends State<TODO> {
  final todolist = TodoList.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(214, 252, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(137, 227, 220, 220),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: Color.fromARGB(136, 54, 53, 53),
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: const ClipRRect(child: Icon(Icons.person)),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 30),
                        child: const Text(
                          'To-Do List',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      for (TodoList todo in todolist)
                        TODOITEM(
                          todo: todo,
                          onToDochanged: _handleToDoChange,
                          onDelteitem: _deleteTodoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _addtodoitem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 9, 56, 95),
                      minimumSize: Size(60, 60),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(TodoList todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  void _addtodoitem(String toDo) {
    setState(() {
      todolist.add(
        TodoList(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            todoText: toDo),
      );
    });

    _todoController.clear();
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 25,
              minWidth: 30,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Color.fromARGB(255, 79, 91, 97))),
      ),
    );
  }
}
