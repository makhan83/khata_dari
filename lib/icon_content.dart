import 'package:flutter/material.dart';
import 'package:khata_dari/constants.dart';

class IconCard extends StatelessWidget {
  final String contentText;
  final IconData contentIcon;

  IconCard({this.contentText,this.contentIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          contentIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(contentText,style:kLabelTextStyle)

      ],
    );
  }
}