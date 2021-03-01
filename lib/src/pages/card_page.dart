import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text("Titulo"),
            subtitle: Text(
                'Este subtitulo es bastante largo porque necesitamos el ejemplo'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://www.ninoversace.com/wp-content/uploads/landscape-mountains-sky-4843193.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://www.ninoversace.com/wp-content/uploads/landscape-mountains-sky-4843193.jpg'),
          // ),
          Container(
              padding: EdgeInsets.all(10.0), child: Text('Pie de Imagen')),
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 10.0,
            color: Colors.black26,
            spreadRadius: 2.0,
            offset: Offset(2.0, 5.0))
      ]),
    );
  }
}
