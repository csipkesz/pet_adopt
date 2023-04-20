import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adopt/configuration.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedMenuIndex = 0;

  Widget buildMenuRow(Map<dynamic, dynamic> item, int index ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedMenuIndex = index;
          });
        },
        child: Row(
          children: [
            Icon(item['icon'], color: selectedMenuIndex == index ? Colors.white : Colors.white38, size: 15),
            const SizedBox(width: 15,),
            Text(item['title'], style: TextStyle(color: selectedMenuIndex == index ? Colors.white : Colors.white38, fontSize: 15, fontWeight: FontWeight.bold))
          ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [startingColor, mainColor]
                )
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(foregroundImage: AssetImage('assets/images/avatar.jpg'), radius: 24.0),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Csipkés Zoltán', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),),
                            Text('Aktív státusz', style: TextStyle(color: Colors.white54, fontSize: 12.0),),
                          ],
                        ),
                      ],
                    ),
                    
                    Column(
                      children: menuItems
                                .asMap()
                                .entries
                                .map((item) => buildMenuRow(item.value, item.key))
                                .toList()
                    ),
              
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.gear, color: Colors.white38, size: 20),
                        const SizedBox(width: 17,),
                        Row(
                          children: const [
                            Text('Beállítások', style: TextStyle(color: Colors.white38, fontSize: 18.0, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10,),
                            Text('|', style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10,),
                            Text('Kijelentkezés', style: TextStyle(color: Colors.white38, fontSize: 18.0, fontWeight: FontWeight.bold)),

                          ],
                        )
                      ]
                    )
                  ],
                ),
              ),
            ),
          ),
        );
  }
}