import 'package:flutter/material.dart';
import 'package:tiktok/tiktok_icons.dart';

class BottomToolbar extends StatelessWidget{
  static const double NavigationIconSize = 20.0;
  static const double CreateButtonWidth = 38.0;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            TikTokIcons.home,
            color: Colors.grey,
            size: NavigationIconSize
          ),
          Icon(
              TikTokIcons.search,
          color: Colors.grey,
          size: NavigationIconSize),
          customCreateIcon,
          Icon(
            TikTokIcons.messages,
            color: Colors.grey,
            size: NavigationIconSize
          ),
          Icon(
            TikTokIcons.profile,
            color: Colors.grey,
            size: NavigationIconSize
          )
        ]
    );
  }

  Widget get customCreateIcon => Container(
    width: 45.0,
    height: 27.0,
    child: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 10.0
          ),
          width: CreateButtonWidth,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(7.0)
          )
        ),
        Container(
          margin: EdgeInsets.only(
            right: 10.0
          ),
          width: CreateButtonWidth,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(7.0)
          )
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: CreateButtonWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Icon(
              Icons.add,
              size: 20.0
            ),
          ),
        )
      ]
    ),
  );
}