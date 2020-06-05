import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';

class IntrayToDo extends StatelessWidget {
  final String title;
  final String keyValue;
  IntrayToDo({this.keyValue, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15, right: 10, left: 10),
      height: 80,
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Radio(

          ),
          Column(
            children: <Widget>[
              Text(title, style: darkTodoTitle)
            ],
          )
        ],
      )
    );
  }
}