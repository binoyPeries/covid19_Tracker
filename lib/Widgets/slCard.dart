import 'package:flutter/material.dart';
import 'package:covid19/Constants.dart';

class SLWidgetCard extends StatelessWidget {
  final String count;
  final String text;
  SLWidgetCard({this.count, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: ksmallCarddec,
        margin: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              count,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              text,
              style: TextStyle(color: Color(0xFF5C5C5C), fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
