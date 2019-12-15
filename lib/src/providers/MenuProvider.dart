import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> options = [];
  _MenuProvider() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('assets/data/menu_opts.json');
    Map dataMap = json.decode(response);
    options = dataMap['routes'];
    return options;
  }
}

final menuProvider = new _MenuProvider();
