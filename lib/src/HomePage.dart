import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/MenuProvider.dart';
import 'package:flutter_components/src/utils/StringIcon.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listItems(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _listItems(BuildContext context, List<dynamic> data) {
    return data.map((opt) {
      return ListTile(
        title: Text(opt['text']),
        trailing: Icon(Icons.arrow_right),
        leading: getIcon(opt['icon']),
        onTap: () {
          Navigator.pushNamed(context,opt['route']);
        },
      );
    }).toList();
  }
}
