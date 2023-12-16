import 'package:flutter/material.dart';

class FruitsVegetablesPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem('Oranges'),
    MenuItem('Alphonso Mango'),
    MenuItem('Green Chilly'),
    MenuItem('Red Onion'),
    MenuItem('Lemon'),
    MenuItem('Brinjal'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits and vegetables'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(menuItems[index].name),
            //subtitle: Text(menuItems[index].description),
            //trailing: Text(menuItems[index].price),
            onTap: () {
              // Handle item selection or details
              // You can navigate to a details screen or perform other actions
            },
          );
        },
      ),
    );
  }
}

class MenuItem {
  final String name;
  //final String description;
  //final String price;

  MenuItem(this.name);
}