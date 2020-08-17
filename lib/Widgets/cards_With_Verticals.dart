import 'package:flutter/material.dart';

class CardsWithVerticals extends StatelessWidget {
  final String deaths;
  final String recovered;
  final String total;
  final double endindent;
  CardsWithVerticals({this.total, this.deaths, this.recovered, this.endindent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                total,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                'Total Cases',
                style: TextStyle(color: Color(0xFF5C5C5C), fontSize: 15.0),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: Colors.grey,
          thickness: 1,
          endIndent: endindent,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                deaths,
                style: TextStyle(color: Color(0xFFEA2149), fontSize: 20.0),
              ),
              Text(
                'Deaths',
                style: TextStyle(color: Color(0xFF5C5C5C), fontSize: 15.0),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: Colors.grey,
          //width: 5.0,
          endIndent: endindent,
          thickness: 1,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                recovered,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Text(
                'Recovered',
                style: TextStyle(color: Color(0xFF5C5C5C), fontSize: 15.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
