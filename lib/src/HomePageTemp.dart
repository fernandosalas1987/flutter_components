import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(children: _createShortList()),
    );
  }

  List<Widget> _createShortList() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text(''),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
