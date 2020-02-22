import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toController = TextEditingController();
  List _toDolist = [];
  Map<String, dynamic> _lastRemove;
  int _lastRemovePos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readData().then((data) {
      setState(() {
        _toDolist = json.decode(data);
      });
    });
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _toController.text;
      _toController.text = "";
      newToDo["ok"] = false;
      _toDolist.add(newToDo);
      _saveData();
    });
  }
  Future<Null> _refresh() async{

    await Future.delayed(Duration(seconds: 1) );

    setState(() {
      _toDolist.sort((a, b){
          if(a["ok"] && !b["ok"]) return 1;
          else if(!a["ok"] && b["ok"]) return -1;
          else return 0;
        }
      );  
      _saveData();
    });
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Task"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _toController,
                    decoration: InputDecoration(
                      labelText: "New Task",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("ADD"),
                    textColor: Colors.white,
                    onPressed: _addToDo),
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicator(onRefresh: _refresh, 
              child: ListView.builder(
            padding: EdgeInsets.only(top: 10.0),
            itemCount: _toDolist.length,
            itemBuilder: buildItem,
          ),)
              )
        ],
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.redAccent,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDolist[index]["title"]),
        value: _toDolist[index]["ok"],
        secondary: CircleAvatar(
          child: Icon(_toDolist[index]["ok"] ? Icons.check : Icons.error),
        ),
        onChanged: (c) {
          setState(() {
            _toDolist[index]["ok"] = c;
            _saveData();
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemove = Map.from(_toDolist[index]);
          _lastRemovePos = index;
          _toDolist.removeAt(index);
          _saveData();

          final snack = SnackBar(
            content: Text("Task \"${_lastRemove["title"]}\" removed"),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _toDolist.insert(_lastRemovePos, _lastRemove);
                    _saveData();
                  });
                }),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).removeCurrentSnackBar(); 
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDolist);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
