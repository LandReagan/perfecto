import 'package:flutter/material.dart';

import 'package:perfecto/widgets/Drawer.dart';
import 'package:perfecto/widgets/FlowTasksWidget.dart';
import 'package:perfecto/objects/Task.dart';


class HomePage extends StatefulWidget {

  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: HomePageDrawer(),
      body: Column(
        children: <Widget>[
          // Last three tasks
          FlowTasksWidget(),
          // Three stories with highest priority

          // Statistics?

          // Projects

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Create',
        child: new Icon(Icons.add),
      ),
    );
  }

  // TODO: Debug stuff to be removed
  List<Task> getSomeTasks() {
    return [
      Task('Task 1', description: 'Description of Task 1'),
      Task('Task 2'),
      Task('Task 3'),
    ];
  }
}