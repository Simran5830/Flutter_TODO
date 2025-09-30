import 'package:flutter/material.dart';
import 'package:flutter_todo/util/todo_tile.dart';

class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<List> todos=[["Code flutter", false],
["Exercise", false]];
  void addTodo(BuildContext context){
    TextEditingController controller= TextEditingController();

    showDialog(context: context, builder: (context){
        return AlertDialog(title: Text("Add TODO"),
        content:
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Enter your task",
            ),
          ),
          actions: [
            ElevatedButton(onPressed: (){
              setState(() {
                if(controller.text.trim().isNotEmpty){
                todos.add([controller.text,false]);
                }
              });
                Navigator.pop(context);
                },
            child: Text("submit")),
            TextButton(onPressed:()=> Navigator.pop(context), child: Text("cancel")),
          ],
        );
    });
  }

  void toggleCheckbox(int index, bool? value){
setState(() {
  todos[index][1]=value;
});
  }
  void deleteTask(int index){
    setState(() {
      todos.removeAt(index);
    }
    );
  }
    
void removeAll(){
  setState(() {
    todos.clear();
  });
  
}

void editTask(int index){
  TextEditingController control= TextEditingController(text: todos[index][0]);
  // control.text= todos[index][0];
  showDialog(context: context, builder: (context) {
    return AlertDialog(title: Text("Edit TODO"),
    content: TextField(
      controller: control,
      decoration: InputDecoration(

      // labelText: control.text
      ),
    ),
    actions: [
      ElevatedButton(onPressed: (){
        setState(() {
          todos[index][0]=control.text;
        });
        Navigator.pop(context);
      } , child: Text("submit"))
    ],
    );
  
  }, 

  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TO DO'), backgroundColor: const Color.fromARGB(255, 119, 91, 5),),
      body: Column(
        children:  [
          Expanded(child:
          Padding(
        padding: EdgeInsets.all(20),
        child:
          ListView.builder(
            itemCount: todos.length,
            itemBuilder:(context, index){
      return TodoTile(taskName: todos[index][0], taskCompleted: todos[index][1], onChanged: (value)=> toggleCheckbox(index, value), deleteFunction: (context)=>deleteTask(index), onEdit: ()=> editTask(index),
  );}))),
    Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
      FloatingActionButton(onPressed:()=>
       addTodo(context)
      , child: Icon(Icons.add),),

 SizedBox(width: 20), // spacing,

      FloatingActionButton(onPressed: (){
      removeAll();
      },child: Icon(Icons.delete),),
        ],),)]
      )
    );
  }
}