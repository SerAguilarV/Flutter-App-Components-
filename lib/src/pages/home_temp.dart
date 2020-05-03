import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems2(),
      ),
    );
  }

  // List<Widget> _crearItems(){
  //   List<Widget> lista = new List<Widget>();
  //   for (var op in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(op),
  //       onTap: ()=>print(op),
  //     );
  //     lista..add(tempWidget)
  //     ..add(Divider(
  //       height: 20,
  //       color: Color(0xFFFF9000),
  //     ));
  //   }
  //     return lista;
  // }

  List<Widget> _crearItems2(){
    var widgets = opciones.map((item){

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + " !!"),
            subtitle: Text("Item: " + item),
            leading: Icon(Icons.accessibility),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: ()=>print(item),
          ),
          Divider(
          )
        ],
      );

    }).toList();

    return widgets;
  }

}






 // children: <Widget>[
        //   ListTile(
        //     title: Text("Hola Mundo 1"),
        //     onTap: ()=>print("Hola Mundo 1"),
        //   ),
        //   Divider(),
        //   ListTile(
        //     title: Text("Hola Mundo 2"),
        //     onTap: ()=>print("Hola Mundo 2"),
        //   ),
        //   Divider(),
        //   ListTile(
        //     title: Text("Hola Mundo 3"),
        //     onTap: ()=>print("Hola Mundo 3"),
        //   ),
        //   Divider(),