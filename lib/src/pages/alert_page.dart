import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => showAlert(context),
          color: Colors.blue,
          child: Text(
            'Mostrar Alerta',
            style: TextStyle(color: Colors.white),
          ),
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restore_page_outlined),
          onPressed: () => Navigator.pop(context)),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }
}
