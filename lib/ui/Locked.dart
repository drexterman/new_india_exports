import 'package:flutter/material.dart';

String downloadURL="";
class LockedPage extends StatefulWidget {
  @override
  _LockedPageState createState() => _LockedPageState();
}

class _LockedPageState extends State<LockedPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Upload Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_person_outlined),
          ],
        //VideoDemo(videoUrl:downloadURL);  
        ),
        
      ),
    );
  }
}
