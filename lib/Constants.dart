import 'package:flutter/material.dart';

final ksmallCarddec = BoxDecoration(
  color: Color(0xFF262626),
  borderRadius: BorderRadius.circular(15.0),
);

const List<Color> kcolorList = [
  Color(0xFFfdd835),
  Color(0xFFEA2149),
  Color(0xFF00838f),
];
const ksearchBox = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(25.0),
  ),
);

String kformatNum(String k) {
  k = k.replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  return k;
}

List<String> countries = [
  'Afghanistan',
  'Australia',
  'Bangladesh',
  'Barbados',
  'Belgium',
  'Brazil',
  'Canada',
  'China',
  'Costa Rica',
  'Finland',
  'France',
  'Germany',
  'India',
  'Indonesia',
  'Iraq',
  'Ireland',
  'Israel',
  'Italy',
  'Japan',
  'Korea (South)',
  'Lebanon',
  'Malaysia',
  'Maldives',
  'Mexico',
  'Netherlands',
  'New Zealand',
  'Pakistan',
  'Portugal',
  'Qatar',
  'Russian Federation',
  'Singapore',
  'South Africa',
  'Spain',
  'Sweden',
  'Switzerland',
  'Thailand',
  'United Arab Emirates',
  'United Kingdom',
  'United States of America'
];
