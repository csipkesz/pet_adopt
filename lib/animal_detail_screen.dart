import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adopt/adoption_screen.dart';

class AnimalDetailScreen extends StatelessWidget {
  final Animal animal;

  AnimalDetailScreen({required this.animal});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
           Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: deviceHeight * 0.5,
                    color: animal.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor)
                                  ),
                                  Icon(CupertinoIcons.share, color: Theme.of(context).primaryColor)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: deviceHeight * 0.35,
                    child: Hero(
                      tag: 'image_${animal.name}',
                      child: Image(
                        image: AssetImage(animal.imageUrl),
                        fit: BoxFit.fitHeight
                      ),
                    ),
                  )
                ]
              ),
        
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const CircleAvatar(radius: 20.0, foregroundImage: AssetImage('assets/images/avatar.jpg'),),
                            const SizedBox(width: 8.0,),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Csipkés Zoltán', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 15),),
                                      const Text('May 25, 2019', style: TextStyle(color: Colors.grey, fontSize: 13),),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text('Owner', style: TextStyle(color: Colors.grey, fontSize: 13),),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
        
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.grey.withOpacity(0.35)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 4.0,
                        color: Theme.of(context).primaryColor,
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Icon(FontAwesomeIcons.heart, color: Colors.white,),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 4.0,
                          color: Theme.of(context).primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Adoption', 
                              style: TextStyle(
                                color: Colors.white, 
                                fontWeight: FontWeight.bold, 
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 8.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                height: deviceHeight * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(animal.name, style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 25, fontWeight: FontWeight.bold),),
                          Icon(animal.isFemale ? FontAwesomeIcons.venus : FontAwesomeIcons.mars, size: 25, color: Colors.grey.withOpacity(0.7))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ 
                          Text(animal.scientificName, style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.bold),),
                          Text('${animal.age} years old', style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.bold),),
                        ]
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.locationDot, color: Theme.of(context).primaryColor, size: 14.0),
                          SizedBox(width: 5,),
                          Text('5 Bulvarno-Kudriavska Street, Kyiv', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}