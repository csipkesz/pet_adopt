import 'package:flutter/material.dart';
import 'package:pet_adopt/adoption_screen.dart';
import 'package:pet_adopt/animal_detail_screen.dart';
import 'package:pet_adopt/configuration.dart';
import 'package:pet_adopt/menu_frame.dart';
import 'package:pet_adopt/menu_screen.dart';

void main() {
  runApp(const AdoptPet());
}

class AdoptPet extends StatelessWidget {
  const AdoptPet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kisállat adoptálás',
        theme: ThemeData(
          primaryColor: mainColor,
          fontFamily: 'Circular',
        ),
        // home: MenuScreen(),
        // home: AdoptionScreen()
        home: MenuFrame()
      );
  }
}
