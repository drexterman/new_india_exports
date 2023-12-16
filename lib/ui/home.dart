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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
        
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
              // desktop1s31 (4:124)
              
              width:  double.infinity,
              
              decoration:  BoxDecoration (
                gradient:  RadialGradient (
                  center:  Alignment(-0.626, 0.2),
                  radius:  0.7,
                  colors:  <Color>[Color(0xff22ceaf), Color(0xff1b413a)],
                  stops:  <double>[0, 0.741],
                ),
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                "Welcome ",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              
              Text(
                _boxLogin.get("userName"),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
                Text(
                " !",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
                ],
              ),
              Image.asset('assets/Logo.png'),
            ],
          ),
      ),
      );
    
  }
}
