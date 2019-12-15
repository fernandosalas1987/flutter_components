import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/Alert.dart';
import 'package:flutter_components/src/routes/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
         return MaterialPageRoute(
           builder: (BuildContext context)=>Alert()
         );
      },
    );
  }
}
