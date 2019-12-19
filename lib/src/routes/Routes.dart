import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/Alert.dart';
import 'package:flutter_components/src/pages/AnimationPage.dart';
import 'package:flutter_components/src/pages/Avatar.dart';
import 'package:flutter_components/src/pages/CardPage.dart';
import 'package:flutter_components/src/pages/InputPage.dart';
import 'package:flutter_components/src/pages/ListViewPage.dart';
import 'package:flutter_components/src/pages/SliderPage.dart';
import '../HomePage.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => Alert(),
    'avatar': (BuildContext context) => Avatar(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer':(BuildContext context)=>AnimationPage(),
    'inputs':(BuildContext context)=>InputPage(),
    'slider':(BuildContext context)=>SliderPage(),
    'list':(BuildContext context)=>ListviewPage()
  };
}
