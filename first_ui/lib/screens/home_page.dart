import 'package:first_ui/utils/coffee_tile.dart';
import 'package:first_ui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int idxSelected = 0;
  final List items = [
    {
      "name": "Cappuccino",
      "selected": true
    },
    {
      "name": "Espresso",
      "selected": false
    },
    {
      "name": "Latte",
      "selected": false
    },
    {
      "name": "The",
      "selected": false
    },
    {
      "name": "Macchiato",
      "selected": false
    },
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      items[index]["selected"] = true;
      items[idxSelected]["selected"] = false;
      idxSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 25.0), child: Icon(Icons.person),)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "You"),
        ],
      ),
        body: Column(
        children: [
          //title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56
              )
            ),
          ),
          SizedBox(height: 25,),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your coffee...",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                )
              ),
            ),
          ),
          SizedBox(height: 25,),

          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CoffeeType(coffeeType: items[index]["name"], isSelected: items[index]["selected"], onTap: () {coffeeTypeSelected(index);});
              },
            ),
          ),

          // horizontal listview of coffee tiles
          Expanded(child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                image: "lib/coffee_pictures/latte.jpg",
                title: "Latte",
                subtitle: "With milk",
                price: "4.55",
              ),
              CoffeeTile(
                image: "lib/coffee_pictures/espresso.jpg",
                title: "Espresso",
                subtitle: "With water",
                price: "7.45",
              ),
              CoffeeTile(
                image: "lib/coffee_pictures/choccomerda.jpg",
                title: "Choccomerda",
                subtitle: "With merda",
                price: "10.00",
              ),
            ],
          ))
        ],
      )
    );
  }
}
