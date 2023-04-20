import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color mainColor = const Color.fromRGBO(48, 96, 96, 1.0);
Color startingColor = const Color.fromRGBO(70, 112, 112, 1.0);

List<Map> menuItems = [
  { 'icon': FontAwesomeIcons.paw, 'title': 'Adoptáció' },
  { 'icon': FontAwesomeIcons.house, 'title': 'Adomány' },
  { 'icon': FontAwesomeIcons.plus, 'title': 'Új háziállat' },
  { 'icon': FontAwesomeIcons.heart, 'title': 'Kedvencek' },
  { 'icon': FontAwesomeIcons.envelope, 'title': 'Üzenetek' },
  { 'icon': FontAwesomeIcons.userLarge, 'title': 'Profil' },
];