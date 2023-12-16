import 'package:flutter/material.dart';

class CerealsPulsesPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem('1509 WHITE SELLA BASMATI RICE', '8.3+mm.','Basmati rice'),
    MenuItem('1509 GOLDEN SELLA BASMATI RICE', '8.35+mm.','Basmati rice'),
    MenuItem('1509 STEAM BASMATI RICE', '8.35+mm.','Basmati rice'),
    MenuItem('1121 WHITE SELLA BASMATI RICE ', '8.35+mm.','Basmati rice'),
    MenuItem('1121 GOLDEN SELLA BASMATI RICE', '8.35+mm.','Basmati rice'),
    MenuItem('1121 STEAM BASMATI RICE', '8.35+mm.','Basmati rice'),
    MenuItem('SUGANDHA WHITE SELLA RICE', '7.85+mm.','Basmati rice'),
    MenuItem('SUGANDHA GOLDEN SELLA RICE', '7.85+mm.','Basmati rice'),
    MenuItem('SUGANDHA STEAM RICE', '7.85+mm.','Basmati rice'),
    MenuItem('PR 11 WHITE SELLA RICE', '6.8+mm.','Basmati rice'),
    MenuItem('PR 11 STEAM RICE', '6.8+mm.','Basmati rice'),
    MenuItem('IR 64 (5% BROKEN RICE)', '6+mm.','Basmati rice'),
    MenuItem('JAI SHREE RAM RICE.', '','Non Basmati rice'),
    MenuItem('AROMATIC CHINNOR RICE.', '','Non Basmati rice'),
    MenuItem('MASOORI RICE.', '','Non Basmati rice'),
    MenuItem('AROMATIC AMBIA MOHAR', '','Non Basmati rice'),
    MenuItem('AROMATIC PARVATI SUT RICE', '','Non Basmati rice'),
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
            subtitle: Text(menuItems[index].description),
            trailing: Text(menuItems[index].price),
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
  final String description;
  final String price;

  MenuItem(this.name, this.description,this.price);
}