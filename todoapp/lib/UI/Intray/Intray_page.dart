import 'package:flutter/material.dart';
import 'package:todoapp/models/classes/task.dart';
import 'package:todoapp/models/global.dart';
import 'package:todoapp/models/widgets/intray_todo.dart';


class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> taskList = [];
  @override
  Widget build(BuildContext context) {
    taskList = getList();
    return Container(
      padding: EdgeInsets.only(top: 200),
      color: darkGreyColor,
      child: _buildReorderableListSimple(context)
    );
  }
  Widget _buildReorderableListSimple(
    BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent
      ),
      child: ReorderableListView(
          // handleSide: ReorderableListSimpleSide.Right,
          // handleIcon: Icon(Icons.access_alarm),
          padding: EdgeInsets.only(top: 20.0),
          children: taskList.map((Task item) => _buildListTile(context, item)).toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              Task item = taskList[oldIndex];
              taskList.remove(item);
              taskList.insert(newIndex, item);
            });
          },
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {

  return ListTile(
    key: Key(item.taskId),
    title: IntrayToDo(
      title: item.title,
    ),
  );
 }


  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
       final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  List<Task> getList() {
    // List<IntrayToDo> list = [];
    for (int i = 0; i<10; i++) {
      taskList.add(Task("My first todo" + i.toString(), false, i.toString()));
    }
    return taskList;
  }
}
