import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _bloquerCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sliders"),),
      body: Container(
        padding: EdgeInsets.only(top:50),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
        ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: "Tamaño de la imagen ${_valorSlider.toInt()} %",
      // divisions: 20,
      min: 10,
      max: 400,
      value: _valorSlider,
      onChanged: (_bloquerCheck) ? null : (valor){
        print(valor);
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://i.pinimg.com/originals/64/8b/f7/648bf78a365ce5a84ab4aac0066bff2f.jpg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

 Widget _crearCheckBox() {

  //  return Checkbox(
  //    value: _bloquerCheck,
  //    onChanged: (valor){
  //      setState(() {
  //        _bloquerCheck=valor;
  //      });
  //    },
  //  );

  return CheckboxListTile(
    title: Text("Bloquear slider"),
    value: _bloquerCheck,
     onChanged: (valor){
       setState(() {
         _bloquerCheck=valor;
       });
     },
    );

 }

  Widget _crearSwitch() {

    return SwitchListTile(
    title: Text("Bloquear slider"),
    value: _bloquerCheck,
     onChanged: (valor){
       setState(() {
         _bloquerCheck=valor;
       });
     },
    );

  }
}