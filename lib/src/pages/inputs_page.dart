import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  //String _password = '';
  String _date = '';
  String _option = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inputs"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createDate(),
            Divider(),
            _createDropdown(),
            Divider(),
            _createPerson(),
          ],
        ));
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffix: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Mi nombre es $_nombre'),
      subtitle: Text('Mi email es $_email'),
      trailing: Text(_option),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffix: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffix: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() {
        //_password = valor;
      }),
    );
  }

  Widget _createDate() {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffix: Icon(Icons.date_range),
          icon: Icon(Icons.date_range_outlined)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccDate(context);
      },
    );
  }

  Future<void> _seleccDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _date = "${picked.day}/${picked.month}/${picked.year}";
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        DropdownButton(
          value: _option,
          items: getOptions(),
          onChanged: (value) {
            setState(() {
              _option = value;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }
}
