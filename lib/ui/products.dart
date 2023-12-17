import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:login_flutter/ui/FruitsVegetablesPage.dart';
import 'package:login_flutter/ui/CerealsPulsesPage.dart';
import 'package:login_flutter/ui/OrganicFoodPage.dart';
import 'package:login_flutter/ui/OthersPage.dart';
import 'package:login_flutter/ui/spices.dart';
import 'package:login_flutter/ui/navbar.dart';


class ProductCategoriesGrid extends StatelessWidget {
  final List<String> categoryNames = [
    'Fruits & Vegetables',
    'Cereals & Pulses',
    'Organic Foods',
    'Others',
    'Spices',
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Product Categories',
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tiles in each row
        ),
        itemCount: categoryNames.length, // Number of tiles
        itemBuilder: (context, index) {
          return CategoryTile(
              categoryIndex: index + 1,
              categoryName: categoryNames[index]); // Index starts from 0
        },
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GoogleFormWebView()),// Functionality for the FAB button
              );
            },
            backgroundColor: Colors.blue, // Background color for the FAB
            child: Icon(Icons.question_mark_sharp), // Icon for the FAB
          ),
          Positioned.fill(
            child: Container(
              //mainAxisAlignment: MainAxisAlignment.start,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 3),
              child: Text(
                'ENQUIRY', // Your text here
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.bold, // Text weight
                  fontSize: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleFormWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Form'),
      ),
      body: WebView(
        initialUrl: 'https://www.newindiaexport.com/home',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final int categoryIndex;
  final String categoryName;

  CategoryTile({required this.categoryIndex, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final categoryImage = 'assets/category$categoryIndex.png';

    return GestureDetector(
      onTap: () {
  // Navigate to the respective category page when the card is tapped
  if (categoryName == 'Fruits & Vegetables') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FruitsVegetablesPage()),
    );
  } else if (categoryName == 'Cereals & Pulses') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CerealsPulsesPage()),
    );
  } else if (categoryName == 'Organic Foods') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrganicFoodPage()),
    );
  } else if (categoryName == 'Others') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OthersPage()),
    );
  }  else if (categoryName == 'Spices') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => spicesPage()),
    );
  }
  
},

      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: MouseRegion(
          cursor: SystemMouseCursors.click, // Change cursor to pointer on hover
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                categoryImage,
                width: 120,
                height: 120,
              ),
              SizedBox(height: 10),
              Text(
                categoryName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String categoryName;

  NewPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('You are in the $categoryName category'),
      ),
    );
  }
}

