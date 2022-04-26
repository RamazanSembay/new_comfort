import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  final String image;
  final bool selected;
  final Function onPressed;
  BottomTabs({this.image, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _selected ? Color(0xff444444) : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        height: 70,
        child: Image(
          color: Color(0xff444444),
          image: AssetImage(image),
          width: 24,
          height: 24,
        ),
        // child: AnimatedContainer(
        //   duration: const Duration(milliseconds: 500),
        //   height: 20,
        //   width: 70,
        //   child: Image(image: AssetImage('icon/home.png'), width: 15, height: 15,),
        //   // child: Icon(
        //   //   icon,
        //   //   size: 28,
        //   //   color: _selected
        //   //       ? Color(0xff8BCAC0)
        //   //       : Color(0xff8BCAC0).withOpacity(0.5),
        //   // ),
        // ),
      ),
    );
  }
}
