import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numbers = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregateTenImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: <Widget>[_createList(context), _createLoading()]),
    );
  }

  Widget _createList(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _numbers[index];
          return FadeInImage(
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?image=$image'),
          );
        },
      ),
    );
  }

  Future<Null> getPage1() async {
    final duration = new Duration(seconds: 2);
     new Timer(duration, () {
      _numbers.clear();
      _lastItem++;
      _agregateTenImages();
    });
    return Future.delayed(duration);
  }

  _agregateTenImages() {
    for (int i = 1; i < 10; i++) {
      _lastItem++;
      _numbers.add(_lastItem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, responseHttp);
  }

  void responseHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100.0,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregateTenImages();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
