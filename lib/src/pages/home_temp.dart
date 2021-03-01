import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _itemCreateShort(),
      ),
    );
  }

  // ignore: unused_element
  List<Widget> _itemCreate() {
    List<Widget> list = List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  List<Widget> _itemCreateShort() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier Cosa'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
