import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///E:/AndroidProjects/projects/covid19/lib/Widgets/CardWidget.dart';
import 'file:///E:/AndroidProjects/projects/covid19/lib/Widgets/bottomnavBar.dart';
import 'package:covid19/networking.dart';
import 'package:covid19/Constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int total = 0;
  int active = 0;
  int deaths = 0;
  int newc = 0;
  int recovered = 0;
  int countries = 0;
  double activePercentage = 0.0;
  double recoveredPercentage = 0.0;
  int lastUpdatedInMinutes = 0;
  @override
  void initState() {
    super.initState();
    getInput();
  }

  void getInput() async {
    GetInformation gI = GetInformation(url: 'summary');
    var globaldata = await gI.getData();
    // print(globaldata['Countries'][157]);
    setState(() {
      var global = globaldata['Global'];
      total = global['TotalConfirmed'];
      deaths = global['TotalDeaths'];
      recovered = global['TotalRecovered'];
      newc = global['NewRecovered'];
      active = total - deaths - recovered;
      countries = globaldata['Countries'].length;
      activePercentage = active / total * 100;
      recoveredPercentage = recovered / total * 100;
      String updatedt = globaldata['Date'];
      lastUpdatedInMinutes = DateTime.now()
          .difference(DateTime.parse(updatedt).toLocal())
          .inMinutes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x99212020),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        kformatNum(total.toString()),
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Text(
                        'Total Cases',
                        style:
                            TextStyle(color: Color(0xFF5C5C5C), fontSize: 20.0),
                      ),
                      flex: 1),
                  SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      kformatNum(active.toString()),
                      style: TextStyle(
                          color: Color(0xFFEA2149),
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                      child: Text(
                        'Active Cases',
                        style: TextStyle(
                          color: Color(0xFF5C5C5C),
                          fontSize: 20.0,
                        ),
                      ),
                      flex: 1),
                  Expanded(
                      child: Text(
                        'Last updated $lastUpdatedInMinutes minutes ago',
                        style:
                            TextStyle(color: Color(0xFF5C5C5C), fontSize: 15.0),
                        textAlign: TextAlign.start,
                      ),
                      flex: 1),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Update!',
                              style: TextStyle(
                                  color: Color(0xFFEA2149), fontSize: 20.0),
                            ),
                            Text(
                              'Currently Active = ${activePercentage.toStringAsFixed(1)}%. \nRecovered = ${recoveredPercentage.toStringAsFixed(1)}% ',
                              style: TextStyle(
                                  color: Color(0xFF5C5C5C), fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: <Widget>[
                        CardWidget(
                          cardName: 'Deaths',
                          icon: FontAwesomeIcons.skull,
                          count: kformatNum(deaths.toString()),
                        ),
                        CardWidget(
                          cardName: 'New Cases',
                          icon: FontAwesomeIcons.bed,
                          count: kformatNum(newc.toString()),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: <Widget>[
                        CardWidget(
                          cardName: 'Recovered',
                          icon: FontAwesomeIcons.leaf,
                          count: kformatNum(recovered.toString()),
                        ),
                        CardWidget(
                          cardName: 'Countries',
                          icon: FontAwesomeIcons.globe,
                          count: countries.toString(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
        clicked: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/country');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/search');
          }
        },
      ),
    );
  }
}
