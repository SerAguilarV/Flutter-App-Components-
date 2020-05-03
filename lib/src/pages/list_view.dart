import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNum = [];
  int _ultimoItem = 0;
  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
          onRefresh: _obtenerPag1,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _listaNum.length,
            itemBuilder: (BuildContext context,int ind){

              final image = _listaNum[ind];
              return FadeInImage(
                placeholder: AssetImage('assets/original.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                image: NetworkImage("https://i.picsum.photos/id/$image/500/300.jpg")
                );
            }
          ),
    );
  }

  Future<Null> _obtenerPag1() async{
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, (){
      _listaNum.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duracion);
  }

  void _agregar10(){
    for (var i = 0; i<10; i++){
        _ultimoItem++;
        _listaNum.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isloading = true;
    setState(() {
    final duracion = Duration(seconds: 2);
    new Timer(duracion, respuestaHTTP);
    });

  }

  void respuestaHTTP(){
    _isloading = false;
    _agregar10();
    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
      );

  }

  Widget _crearLoading() {
    if(_isloading){
      return Column(
        mainAxisSize:  MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15,)
        ],
      );
    }else{
      return Container();
    }
  }

}