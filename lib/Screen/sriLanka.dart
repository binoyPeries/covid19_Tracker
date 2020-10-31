import 'package:covid19/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/AndroidProjects/projects/covid19/lib/Widgets/bottomnavBar.dart';
import 'file:///E:/AndroidProjects/projects/covid19/lib/Widgets/slCard.dart';
import 'package:covid19/Constants.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid19/Widgets/cards_With_Verticals.dart';

class SriLanka extends StatefulWidget {
  @override
  _SriLankaState createState() => _SriLankaState();
}

class _SriLankaState extends State<SriLanka> {
  final int index = 1;
  int active = 0;
  int total = 0;
  int recovered = 0;
  int deaths = 0;
  int newcases = 0;
  int newrec = 0;
  int newdeath = 0;
  Map<String, double> dataMap = {
    'Active': 0,
    'Deaths': 0,
    'Recovered': 0,
  };
  @override
  void initState() {
    super.initState();
    getInput();
  }

  void getInput() async {
    GetInformation sl = GetInformation(url: "summary");
    var data = await sl.getData();
    setState(() {
      var slData = data['Countries'][161];
      total = slData['TotalConfirmed'];
      recovered = slData['TotalRecovered'];
      deaths = slData['TotalDeaths'];
      newcases = slData['NewConfirmed'];
      newdeath = slData['NewDeaths'];
      newrec = slData['NewRecovered'];
      active = total - recovered - deaths;
      dataMap = {
        'Active': active.toDouble(),
        'Deaths': deaths.toDouble(),
        'Recovered': recovered.toDouble(),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x99212020),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'SRI LANKA',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Expanded(
                child: Image.asset(
                  'images/sl.png',
                  scale: 2.5,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: <Widget>[
                  Text(
                    kformatNum(active.toString()),
                    style: TextStyle(color: Color(0xFFEA2149), fontSize: 30.0),
                  ),
                  Text(
                    'Active',
                    style: TextStyle(color: Color(0xFF5C5C5C), fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 1,
                child: CardsWithVerticals(
                  total: kformatNum(total.toString()),
                  deaths: kformatNum(deaths.toString()),
                  recovered: kformatNum(recovered.toString()),
                  endindent: 30.0,
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 1.0,
                        //width: 80.0,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Daily Figure',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF5C5C5C)),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1.0,
                        //width: 80.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      SLWidgetCard(
                        count: kformatNum(newcases.toString()),
                        text: 'New cases',
                      ),
                      SLWidgetCard(
                        count: kformatNum(newdeath.toString()),
                        text: 'Deaths',
                      ),
                      SLWidgetCard(
                        count: kformatNum(newrec.toString()),
                        text: 'Recovered',
                      )
                    ],
                  )),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: ksmallCarddec,
                  child: PieChart(
                    dataMap: dataMap,
                    animationDuration: Duration(seconds: 3),
                    colorList: kcolorList,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    chartLegendSpacing: 30.0,
                    chartValueStyle: defaultChartValueStyle.copyWith(
                        color: Colors.black.withOpacity(0.9), fontSize: 15.0),
                    legendStyle: TextStyle(color: Color(0xFF5C5C5C)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
          index: 1,
          clicked: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/');
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, '/search');
            }
          }),
    );
  }
}
