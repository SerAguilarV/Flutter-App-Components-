import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
          );
        }
// ***
// Lista Future
// ***
  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }


// ***
// Lista Items
// ***
  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> op = [];

    data.forEach((opt){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: Icon(Icons.insert_emoticon, color: Colors.blueAccent,),
        trailing: getIcon(opt['icon']),
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      op..add(widgetTemp)
      ..add(Divider());
    });

    return op;
  }
}