import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _expirationDate = '';
  TextEditingController _dateController = new TextEditingController();
  List<String> _poderes = ['volar', 'rayos x', 'súper fuerza'];
  String _selected = 'volar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
          Divider(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counter: Text('Letras ${_name.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  _createPerson() {
    return ListTile(
      title: Text('Su nombre es: $_name'),
      subtitle: Text('Su email es:$_email'),
      trailing: Text('Su poder es $_selected'),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          helperText: 'Email',
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (value) {
        setState(() => _email = value);
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          helperText: 'Password',
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (value) {
        setState(() => _email = value);
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _dateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          helperText: 'Fecha de vencimiento',
          hintText: 'Fecha',
          labelText: 'Fecha de vencimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _expirationDate = picked.toString();
        _dateController.text = _expirationDate;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropDownOptions() {
    List<DropdownMenuItem<String>> list = new List();
    _poderes.forEach((poder) {
      list.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return list;
  }

  Widget _createDropdown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(
        width: 30.0,
      ),
      DropdownButton(
        items: getDropDownOptions(),
        value: _selected,
        onChanged: (option) {
          setState(() {
            _selected = option;
          });
        },
      )
    ]);
  }
}
