import 'package:flutter/material.dart';
import 'package:final_aplication/src/providers/menu_provider.dart';
import 'package:final_aplication/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.updateData()

    return FutureBuilder(
      future: menuProvider.updateData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    Color color = Colors.blue;

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: color,
        ),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
