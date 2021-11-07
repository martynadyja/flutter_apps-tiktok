import 'package:flutter/material.dart';
import '../tiktok_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActionsToolbar extends StatelessWidget {
  static const double ActionWidgetSize = 60.0;
  static const double ActionIconSize = 35.0;
  static const double ShareActionIconSize = 25.0;
  static const double ProfileImageSize = 50.0;
  static const double PlusIconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.0,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getFollowAction(),
              _getSocialAction(
                  icon: TikTokIcons.heart, title: '5.3 m'
              ),
              _getSocialAction(
                  icon: TikTokIcons.chat_bubble, title: '14.7k'
              ),
              _getSocialAction(
                  icon: TikTokIcons.reply, title: 'Udostępnij', isShare: true
              ),
              _getMusicPlayerAction(),
            ]
        )
    );
  }


  Widget _getSocialAction({
    String title,
    IconData icon,
    bool isShare = false}) {
    return Container(
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Icon(
            icon, size: isShare ? ShareActionIconSize : ActionIconSize,
            color: Colors.grey[300],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: isShare ? 5.0 : 2.0
            ),
            child: Text(
                title,
                style: TextStyle(
                    fontSize: isShare ? 10.0 : 11.0
                )
            ),)
        ],
      ),
    );
  }

  Widget _getFollowAction() {
    return Container(
      width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Stack(
          children: [
            _getProfilePicture(),
            _getPlusIcon()
          ]
      ),
    );
  }

  Widget _getProfilePicture() {
    return Positioned(
      left: ((ActionWidgetSize / 2) - (ProfileImageSize / 2)),
        child: Container(
          height: ProfileImageSize,
          width: ProfileImageSize,
          padding: EdgeInsets.all(
            1.0
          ),
          decoration: BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.circular(ProfileImageSize / 2)
          ),
          child: CachedNetworkImage(
            imageUrl: "https://icon-library.com/images/50x50-icon/50x50-icon-0.jpg",
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error, color: Colors.red),
          ),
        ));
  }

  Widget _getPlusIcon() {
    return Positioned(
       bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
        width: PlusIconSize,
        height: PlusIconSize,
        decoration: BoxDecoration(
          color: Colors.purple,
        borderRadius: BorderRadius.circular(15.0)),
        child: Icon(
          Icons.add,
        color: Colors.white70,
        size: 20.0),
      ),
    );
  }

  LinearGradient get musicGradient => LinearGradient(
      colors: [
        Colors.brown[800],
        Colors.brown[900],
        Colors.brown[900],
        Colors.brown[800]
      ],
  stops: [
    0.0, 0.4, 0.6, 1.0
  ],
  begin: Alignment.bottomLeft,
      end: Alignment.topRight
  );

  Widget _getMusicPlayerAction(){
    return Container(
       width: ActionWidgetSize,
      height: ActionWidgetSize,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: ProfileImageSize,
            width: ProfileImageSize,
            decoration: BoxDecoration(
              gradient: musicGradient,
              borderRadius: BorderRadius.circular(ProfileImageSize / 2)
            ),
            child: CachedNetworkImage(
              imageUrl: "https://icon-library.com/images/50x50-icon/50x50-icon-0.jpg",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error)
            )
          )
        ]
      )
    );
  }
}