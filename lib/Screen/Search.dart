import 'package:flutter/material.dart';
import 'file:///E:/AndroidProjects/projects/covid19/lib/Widgets/bottomnavBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19/Constants.dart';
import 'CountryScreen.dart';

class SearchByCountry extends StatefulWidget {
  @override
  _SearchByCountryState createState() => _SearchByCountryState();
}

class _SearchByCountryState extends State<SearchByCountry> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x99212020),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.globeEurope,
                    color: Color(0xFFEA2149),
                    size: 30.0,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    items:
                        countries.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newvalue) {
                      setState(() {
                        dropdownValue = newvalue;
                      });
                    },
                    underline: Container(
                      height: 2,
                      color: Color(0xFFEA2149),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.caretDown,
                      color: Color(0xFFEA2149),
                    ),
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Container(
                  child: dropdownValue != null
                      ? CountryScreen(
                          selectedItem: dropdownValue,
                        )
                      : Center(
                          child: Text(
                            'Select Country',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
          index: 2,
          clicked: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/');
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, '/country');
            }
          }),
    );
  }
}
