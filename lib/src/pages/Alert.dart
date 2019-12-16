import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed:()=> _showAlert(context),
          child: Text('Mostrar alerta'),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ) ,
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de la caja de alerta'),
              FlutterLogo(size: 100.0,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('ok'),
              onPressed:()=>Navigator.of(context).pop(),
            )
          ],
        );
      }
      );
  }
}
