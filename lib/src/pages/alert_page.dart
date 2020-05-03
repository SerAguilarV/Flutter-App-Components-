import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){Navigator.pop(context);}
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Mostrar alerta"),
            color: Colors.blueAccent,
            onPressed: (){_mostrarAlerta(context);},
            textColor: Colors.white,
            shape: StadiumBorder(),
          ) ,
        ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Contenido de la caja de alerta"),
              FlutterLogo(size: 100,),
            ],
          ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancelar"),
          onPressed: ()=>Navigator.of(context).pop(),
          color: Colors.red,
          textColor: Colors.white,
        ),
        FlatButton(
          child: Text("Ok"),
          onPressed: ()=>Navigator.of(context).pop(),
          color: Colors.red,
          textColor: Colors.white,
        ),
      ],
        );
      }
    );
  }
}