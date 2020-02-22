import 'package:flutter/material.dart';


class TaskList extends StatefulWidget{
  TaskList({Key key}) : super(key: key);

  
  @override
  _TaskListState createState() => _TaskListState();

}
final int _totalPendecias = 41;
//final String _labelPendencias = ;
final  _totalMinhaPendencias = Text('Todas pendências');

//_totalMinhaPendencias   Text( _totalPendecias.toString()  style: TextStyle(fontSize: 32.0, color: Colors.red));
              
class _TaskListState extends   State<TaskList>{
  
  
 
  //final tkList = 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text('Main Task List')),
      body: Center(
        child: Container(
          color: Colors.teal,
            child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Minhas pendências'),
               new Expanded(
                 child: tkList(context),
               ),
                ]
            )
            )
        ),
      ),
    );
  }
  

 static tkList(BuildContext context){
   return new ListView(
                      padding: const EdgeInsets.all(40),
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {  Navigator.pushNamed(context, '/todasPendencias'); },
                          child: Container(
                          height: 50,
                          color: Colors.amber[600],
                          child: Row(children: <Widget>[
                            FlatButton.icon(icon:Icon(Icons.list), label:_totalMinhaPendencias, onPressed: () {
                               Navigator.pushNamed(context, '/todasPendencias');
                            },),
                            Text('$_totalPendecias',style: TextStyle(backgroundColor: Colors.grey,color: Colors.white ),),
                          ],)
                          
                        ),
                      ),                     
                        
                        SizedBox(height: 20.0),
                        Container(
                          height: 50,
                          color: Colors.amber[500],
                           child: FlatButton.icon(icon:Icon(Icons.calendar_today), label:Text('Tarefas para hoje'), onPressed: () {},),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[100],
                          child: FlatButton.icon(icon:Icon(Icons.calendar_today), label:Text('Tarefas com atraso'), onPressed: () {},),
                        ),
                      ],
                    );
 }
}
