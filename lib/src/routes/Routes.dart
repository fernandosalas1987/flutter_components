import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/Alert.dart';
import 'package:flutter_components/src/pages/Avatar.dart';
import 'package:flutter_components/src/pages/CardPage.dart';
import '../HomePage.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => Alert(),
    'avatar': (BuildContext context) => Avatar(),
    'card': (BuildContext context) => CardPage()
  };
}
