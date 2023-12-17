import 'package:flutter/material.dart';

class spicesPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem('Turmeric'),
    MenuItem('Black Pepper'),
    MenuItem('Cumin (jeera)'),
    MenuItem('Coriander'),
    MenuItem('Red Chilly Powder'),
    MenuItem('Clove'),
    MenuItem('Cardamom'),
    MenuItem('Cinnamon'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cereals and Pulses'),
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