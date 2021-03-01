import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/f1/0c/3e/f10c3ea27ba159af9f96b94ebec23006.jpg'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/f/ff/Albert_Bierstadt_-_Rocky_Mountain_Landscape_-_Google_Art_Project.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
