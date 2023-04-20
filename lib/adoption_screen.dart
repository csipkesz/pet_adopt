import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adopt/animal_detail_screen.dart';

class Animal {
  String name;
  String scientificName;
  double age;
  String distanceToUser;
  bool isFemale;
  String imageUrl;
  Color backgroundColor;

  Animal({
    required this.name,
    required this.scientificName,
    required this.age,
    required this.distanceToUser,
    required this.isFemale,
    required this.imageUrl,
    required this.backgroundColor
  });
}

class AdoptionScreen extends StatefulWidget {

  final void Function()? menuCallback;
  AdoptionScreen({required this.menuCallback});

  @override
  State<AdoptionScreen> createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  int selectedAnimalIconIndex = 0;

  final List<Animal> animals = [
    Animal(name: 'Sola', scientificName: 'Abyssinian cat', age: 2, distanceToUser: '3.6 km',isFemale: true, imageUrl: 'assets/images/sola.png', backgroundColor: const Color.fromRGBO(203, 213, 216, 1.0)),
    Animal(name: 'Orion', scientificName: 'Abyssinian cat', age: 1.5, distanceToUser: '7.8 km',isFemale: false, imageUrl: 'assets/images/pet-cat1.png', backgroundColor: const Color.fromRGBO(237, 214, 180, 1.0)),
    Animal(name: 'Lajos', scientificName: 'Abyssinian cat', age: 2, distanceToUser: '3.6 km',isFemale: true, imageUrl: 'assets/images/pet-cat2.png', backgroundColor: const Color.fromRGBO(203, 213, 216, 1.0)),
    Animal(name: 'Mocó', scientificName: 'Abyssinian cat', age: 2, distanceToUser: '3.6 km',isFemale: true, imageUrl: 'assets/images/pet-cat3.png', backgroundColor: const Color.fromRGBO(203, 213, 216, 1.0)),
    Animal(name: 'István', scientificName: 'Abyssinian cat', age: 2, distanceToUser: '3.6 km',isFemale: true, imageUrl: 'assets/images/sola.png', backgroundColor: const Color.fromRGBO(203, 213, 216, 1.0)),
    Animal(name: 'Kócos', scientificName: 'Abyssinian cat', age: 2, distanceToUser: '3.6 km',isFemale: true, imageUrl: 'assets/images/sola.png', backgroundColor: const Color.fromRGBO(203, 213, 216, 1.0)),
  ];

  List<Map> animalTypes = [
    { 'type': 'Cats', 'icon': FontAwesomeIcons.cat },
    { 'type': 'Dogs', 'icon': FontAwesomeIcons.dog },
    { 'type': 'Parrots', 'icon': FontAwesomeIcons.crow },
    { 'type': 'Otter', 'icon': FontAwesomeIcons.otter },
    { 'type': 'Fish', 'icon': FontAwesomeIcons.fish },
    { 'type': 'Horse', 'icon': FontAwesomeIcons.horse },
    { 'type': 'Spider', 'icon': FontAwesomeIcons.spider },
  ];

  Widget buildAnimalIcon(index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            highlightColor: Colors.red,
            onTap: () {
              setState(() {
                selectedAnimalIconIndex = index;
              });
            },
            child: Material(
              color: selectedAnimalIconIndex == index ? Theme.of(context).primaryColor : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(animalTypes[index]['icon'], size: 30, color: selectedAnimalIconIndex != index ? Theme.of(context).primaryColor : Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(animalTypes[index]['type'], style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15.0),),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: widget.menuCallback,
                      child: Icon(FontAwesomeIcons.bars)
                    ),
                    Column(
                      children: [
                        const Text('Location', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15)),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.locationDot, color: Theme.of(context).primaryColor),
                            Text('Hungary, ', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                            const Text('Budapest', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18))
                          ],
                        )
                      ],
                    ),
                    const CircleAvatar(foregroundImage: AssetImage('assets/images/avatar.jpg'), radius: 20.0),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Color.fromRGBO(202, 202, 202, 0.5)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: const [
                            Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.grey, size: 18),
                            Expanded(
                              child: TextField(
                                style: TextStyle(fontSize: 15.0), 
                                decoration: InputDecoration(hintText: 'Search pets to adopt', border: OutlineInputBorder(borderSide: BorderSide.none)),
                              )
                            ),
                            Icon(FontAwesomeIcons.filter, color: Colors.grey, size: 20)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 110,
                      child: ListView.builder(
                        itemCount: animalTypes.length, 
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) { 
                          return buildAnimalIcon(index);
                        }),
                    ),

                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: animals.length, 
                        scrollDirection: Axis.vertical, 
                        itemBuilder: (context, index) {
                        final animal = animals[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AnimalDetailScreen(animal: animal);
                            })
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [ 
                                Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  elevation: 4.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: (deviceWidth * 0.4)),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(animal.name, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22, fontWeight: FontWeight.bold),),
                                                    Icon(animal.isFemale ? FontAwesomeIcons.venus : FontAwesomeIcons.mars, size: 20, color: Colors.grey.withOpacity(0.7))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Text(animal.scientificName, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15, fontWeight: FontWeight.w500),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Text('${animal.age} years old', style: const TextStyle(color: Colors.grey, fontSize: 10),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  children: [
                                                    Icon(FontAwesomeIcons.locationDot, color: Theme.of(context).primaryColor, size: 14.0),
                                                    Text('Distance: ${animal.distanceToUser}', style: const TextStyle(color: Colors.grey)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          
                                Stack(
                                  alignment: Alignment.center,
                                  children: [ 
                                    Container(
                                      decoration: BoxDecoration(
                                        color: animal.backgroundColor,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      height: 200,
                                      width: deviceWidth * 0.4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 35),
                                      child: Hero(tag: 'image_${animal.name}', child: Image(image: AssetImage(animal.imageUrl), height: 220, width: deviceWidth * 0.4,)),
                                    )
                                  ]
                                )
                              ]
                            ),
                          ),
                        );
                      })
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}