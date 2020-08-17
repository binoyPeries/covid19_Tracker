import 'package:flutter/material.dart';
import 'package:covid19/Widgets/cards_With_Verticals.dart';
import 'package:covid19/networking.dart';
import 'package:covid19/Constants.dart';
import 'package:covid19/Widgets/slCard.dart';

class CountryScreen extends StatefulWidget {
  final String selectedItem;
  CountryScreen({this.selectedItem});
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  String countryName = "";
  int total = 0;
  int active = 0;
  int deaths = 0;
  int recovered = 0;

  @override
  void initState() {
    super.initState();
    getInput();
  }

  void getInput() async {
    GetInformation gt = new GetInformation(url: "summary");
    var data = await gt.getData();
    var countries = data['Countries'];
//    print(countries);
    if (widget.selectedItem != null) {
      for (int i = 0; i < countries.length; i++) {
        if (countries[i]["Country"] == widget.selectedItem) {
          //print(countries[i]["Country"]);
          setState(() {
            countryName = widget.selectedItem;
            total = countries[i]["TotalConfirmed"];
            recovered = countries[i]["TotalRecovered"];
            deaths = countries[i]["TotalDeaths"];
            active = total - deaths - recovered;
          });
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: 1.0,
          //width: 80.0,
          color: Colors.grey,
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            countryName,
            style: TextStyle(fontSize: 30.0),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: Color(0xFFEA2149),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  kformatNum(active.toString()),
                  style: TextStyle(color: Color(0xFFEA2149), fontSize: 30.0),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Active',
                  style: TextStyle(color: Color(0xFF5C5C5C), fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              SLWidgetCard(
                text: "Total Cases",
                count: kformatNum(total.toString()),
              ),
              SLWidgetCard(
                text: "Recovered",
                count: kformatNum(recovered.toString()),
              ),
              SLWidgetCard(
                text: "Deaths",
                count: kformatNum(deaths.toString()),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180.0,
        )
      ],
    );
  }
}
