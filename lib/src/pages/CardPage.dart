import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
           SizedBox(height: 20.0),
          _cardType2(),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Título'),
            subtitle: Text('Subtítulo de la tarjeta 1 del curso de flutter'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card2 = Container(
        child: Column(
      children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(
              'https://lh3.googleusercontent.com/-H6PacdskbPehw_P3NQvLvIix3PK3gNC82AZXhpFhYm5PVY26CqyHieUp_jifhmYY-FrcezAVQ=w640-h400-e365'),
          fadeInDuration: Duration(milliseconds: 200),
          fit: BoxFit.cover,
        ),
        Container(
            padding: EdgeInsets.all(10.0), child: Text('Texto de segunda card'))
      ],
    ));
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
            )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
         child: card2),
    );
  }
}
