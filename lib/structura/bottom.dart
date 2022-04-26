import 'package:new_comfort/structura/bottom_tabs.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  Bottom({this.selectedTab, this.tabPressed});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0xff777777).withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 30,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabs(
              image: 'icon/home.png',
              selected: _selectedTab == 0 ? true : false,
              onPressed: () {
                widget.tabPressed(0);
              },
            ),
            BottomTabs(
              image: 'icon/bag.png',
              selected: _selectedTab == 1 ? true : false,
              onPressed: () {
                widget.tabPressed(1);
              },
            ),
            BottomTabs(
              image: 'icon/favorite.png',
              selected: _selectedTab == 2 ? true : false,
              onPressed: () {
                widget.tabPressed(2);
              },
            ),
            BottomTabs(
              image: 'icon/store.png',
              selected: _selectedTab == 3 ? true : false,
              onPressed: () {
                widget.tabPressed(3);
              },
            ),
            BottomTabs(
              image: 'icon/person.png',
              selected: _selectedTab == 4 ? true : false,
              onPressed: () {
                widget.tabPressed(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
