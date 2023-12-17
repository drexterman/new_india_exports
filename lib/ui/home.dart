import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_flutter/ui/navbar.dart';

import 'login.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text("New India Exports"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  _boxLogin.clear();
                  _boxLogin.put("loginStatus", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 236, 231, 223),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*Image.asset(
            'assets/background.jpg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          // Semi-transparent Overlay
          Container(
            color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
          ),*/
          // Main Content

        SingleChildScrollView(
                    child: Column(
            
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                    "Welcome ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 27, 29, 29),
                      fontSize: 30,

                    ),
                  ),
                  
                  Text(
                    _boxLogin.get("userName"),
                    style: TextStyle(
                      color: Color.fromARGB(255, 27, 29, 29),
                      fontSize: 30,
                    ),
                  ),
                    Text(
                    " !",
                    style: TextStyle(
                      color: Color.fromARGB(255, 27, 29, 29),
                      fontSize: 30,
                    ),
                  ),
                    ],
                  ),
                  Image.asset('assets/Logo.png'),
                  SizedBox(height: 30, width:30),
                  Text("Connecting farmers to you: Uncompromised Quality, Directly Delivered.",
                  style:TextStyle(
                    color: Color.fromARGB(255, 123, 104, 93),
                    fontSize: 20,
                  ),
                  ),
                ],
                
              ),
        ),
        ],
      ),
      );
    
  }
}
