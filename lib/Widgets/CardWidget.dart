import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({this.cardName, this.count, this.icon});
  final IconData icon;
  final String count;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF262626),
            borderRadius: BorderRadius.circular(15.0)),
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Icon(
                          icon,
                          color: Color(0xFFEA2149),
                          size: 25.0,
                        ),
                      ),
                      Center(
                        child: Text(
                          count,
                          style: TextStyle(fontSize: 30.0),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      cardName,
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF808080)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF3D3D3D),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  // pad
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
