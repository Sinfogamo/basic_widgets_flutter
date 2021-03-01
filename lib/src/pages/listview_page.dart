import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastItem = 0;
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTen();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Builder'),
      ),
      body: Stack(children: [_createList(), _createLoading()]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNumbers[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> refresh() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _addTen();
    });

    return Future.delayed(duration);
  }

  void _addTen() {
    for (int i = 0; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    new Timer(duration, answerHttp);
  }

  void answerHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _addTen();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
