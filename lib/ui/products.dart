import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:login_flutter/ui/FruitsVegetablesPage.dart';
import 'package:login_flutter/ui/CerealsPulsesPage.dart';
import 'package:login_flutter/ui/OrganicFoodPage.dart';
import 'package:login_flutter/ui/OthersPage.dart';
import 'package:login_flutter/ui/spices.dart';
import 'package:login_flutter/ui/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

//in my navbar.dart when you click on products the function below gets called
//this function returns a scaffold widget which has a navbar at top left , an AppBar which with product categories written , a body which 
//calls class CategoryTiles to make tiles of the given no. of products and a floating action button which  open whatsapp dm onTap.
class ProductCategoriesGrid extends StatelessWidget {
  // Merchant's WhatsApp number
  final String merchantNumber = '+917738012421'; // Replace with the merchant's phone number

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
        backgroundColor: Colors.white,
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
              //GoogleFormWebView();
          _openWhatsAppChat(merchantNumber);

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

    // Function to open WhatsApp chat
  void _openWhatsAppChat(String phoneNumber) async {
    String message = 'Hello I would like to place an order'; // Optional: You can include a predefined message here

    // Construct the WhatsApp URL with the merchant's phone number and optional message
    //String url = 'https://api.whatsapp.com/send?phone=$phoneNumber';
    final Uri _url = Uri.parse('https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}');
    if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
  }
}

//uncomment the below code if you want to open a google form on tapping on enquiry button  
/*
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
*/


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

