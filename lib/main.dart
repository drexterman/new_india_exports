import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async'; // Ensure you import dart:async
import 'main_app.dart';
//import 'firebase_options.dart';

/*void main() async {
  await _initHive();
  runApp(const MainApp());
}

Future<void> _initHive() async{
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}
*/
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){

    await Firebase.initializeApp(options: FirebaseOptions(apiKey:"AIzaSyAqHJuwM36Pz8Bt2gB4VokiY_FEzXoCZTA", appId: "1:1030809240540:web:8702ee921e0893c1f88519", messagingSenderId: "1030809240540", projectId: "newindiaexports-bb3af"));
  }
  await Firebase.initializeApp();
  runApp(const MainApp());
}