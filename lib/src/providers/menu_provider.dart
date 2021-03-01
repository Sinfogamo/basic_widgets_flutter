import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];
  _MenuProvider() {
    updateData();
  }

  Future<List<dynamic>> updateData() async {
    final ruta = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(ruta);
    return options = dataMap['rutas'];
  }
}

final menuProvider = new _MenuProvider();
