import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _pass = "";
  String _fecha = "";
  String _opSelect = "Volar";
  List<String> _poderes = ["Volar", "Rayos X", "Super Fuerza"];

  TextEditingController _inputField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de Texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropBox(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: 'Nombre',
        helperText: 'Solo Nombre',
        suffix: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor){
        print(_nombre);
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() =>ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email \nPassword: $_pass "),
      leading: Text(_opSelect),
    );

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: "Email",
        labelText: 'Email',
        suffix: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor){
        print(_nombre);
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearPass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: "Password",
        labelText: 'Password',
        suffix: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor){
        print(_pass);
        setState(() {
          _pass = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputField,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: "Fecha de Nacimiento",
        labelText: 'Fecha de Nacimiento',
        suffix: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'MX'),
    );
    if (picked != null){
      setState(() {
        _fecha = "${picked.day.toString()}/${picked.month.toString()}/${picked.year.toString()}";
        _inputField.text = _fecha;
    });
  }
  }

  List<DropdownMenuItem<String>> getOpciones(){
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropBox() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30,),
        Expanded(
          child: DropdownButton(
            items: getOpciones(),
            value: _opSelect,
            onChanged: (opt){
              print(opt);
              setState(() {
                _opSelect = opt;
              });
            },
            ),
        ),
        SizedBox(width: 30,),
      ],
    );
  }
}