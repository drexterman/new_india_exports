import 'package:flutter/material.dart';

class OrganicFoodPage extends StatelessWidget {
final List<MenuItem> menuItems = [
    MenuItem('Vegetables'),
    MenuItem('Fruits'),
    MenuItem('Spices'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organic Food'),
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