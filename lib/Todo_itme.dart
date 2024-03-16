import 'package:flutter/material.dart';
import 'package:to_do/todo.dart';

class TODOITEM extends StatelessWidget {
  final TodoList todo;
  final onToDochanged;
  final onDelteitem;

  TODOITEM(
      {Key? key,
      required this.todo,
      required this.onToDochanged,
      required this.onDelteitem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print('Clicked on Todo Item!!');
          onToDochanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box_rounded : Icons.check_box_outline_blank,
          color: Colors.black,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(96, 13, 80, 122),
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 151, 26, 17),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              //print('Deleted!!!');
              onDelteitem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
