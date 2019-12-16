import 'package:flutter/material.dart';
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _createInput(),
                  ],
                ),
              );
            }
          
            Widget _createInput() {
              return TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  counter: Text('Letras 0'),
                  hintText: 'Nombre de la persona',
                  labelText: 'Nombre',
                  helperText: 'Sólo es el nombre',
                  suffixIcon: Icon(Icons.accessibility),
                  icon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              );
            }
}