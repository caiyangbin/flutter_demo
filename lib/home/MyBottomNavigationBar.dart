import 'package:flutter/material.dart';
import 'package:fancy_bar/fancy_bar.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> _setCount;

  MyBottomNavigationBar(this._setCount);

  @override
  Widget build(BuildContext context) {
    return FancyBottomBar(
      type: FancyType.FancyV1, // Fancy Bar Type
      selectedIndex: 0,
      items: [
        FancyItem(
          textColor: Colors.green,
          title: 'Home',
          icon: Icon(Icons.home),
        ),
        FancyItem(
          textColor: Colors.green,
          title: 'Trending',
          icon: Icon(Icons.trending_up),
        ),
        FancyItem(
          textColor: Colors.green,
          title: 'Search',
          icon: Icon(Icons.search),
        ),
        FancyItem(
          textColor: Colors.green,
          title: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
      onItemSelected: (index) {
        _setCount.call(index);
      },
    );
  }
}
