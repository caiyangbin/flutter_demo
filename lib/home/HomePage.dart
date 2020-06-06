import 'package:flutter/material.dart';
import 'package:flutter_demo/home/MeituluListPage.dart';
import 'ImageGalleryPage.dart';
import 'MyBottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count;
  List pages = [MeituluPage()];

  void _setCount(int count) {
    setState(() {
      this._count = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美图录'),
        leading: Icon(Icons.menu),
      ),
      bottomNavigationBar: MyBottomNavigationBar(_setCount),
      body: Center(
        child: MeituluPage(),
      ),
    );
  }
}
