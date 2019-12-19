import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _disableCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen $_valueSlider',
      divisions: 20,
      onChanged: (_disableCheck)
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
              });
            },
      value: _valueSlider,
      min: 0.0,
      max: 400.0,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'http://pm1.narvii.com/6915/9c2fea711c3288ade786a73f8ae6d43a2c916269r1-720-1011v2_uhq.jpg'),
      width: _valueSlider,
      height: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _disableCheck,
      onChanged: (value) {
        setState(() {
          _disableCheck = value;
        });
      },
    );
  }
}
