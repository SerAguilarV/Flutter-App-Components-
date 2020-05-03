import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards")
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30,),
          _cardTipo2(),
          SizedBox(height: 30,),
          _cardTipo1(),
          SizedBox(height: 30,),
          _cardTipo2(),
          SizedBox(height: 30,),
          _cardTipo1(),
          SizedBox(height: 30,),
          _cardTipo2(),
          SizedBox(height: 30,),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child:Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blueAccent),
            title: Text("Titulo de Tarjeta"),
            subtitle: Text("qwertyuiop asdfghjklñ zxcvbnm 123456789 qwertyuiop asdfghjklñ zxcvbnm 123456789"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(child: Text("Cancelar"), onPressed: ()=>{},),
              FlatButton(child: Text("Ok"), onPressed: ()=>{},),
            ],
          )
        ],
      )
    );
  }

  Widget _cardTipo2() {

    final tarjeta = Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ae/Joseph_Wright_of_Derby_-_Italian_Landscape_with_Mountains_and_a_River_-_Google_Art_Project.jpg'),
            placeholder: AssetImage('assets/original.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Hola Mundo")
            )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.black26,
            spreadRadius: 2,
            offset: Offset(2,10)
          )
        ],
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        // color: Colors.red,
        ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: tarjeta,
      ),
      );
  }
}