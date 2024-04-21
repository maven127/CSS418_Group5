import 'package:flutter/material.dart';
import 'package:futwebapp/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:futwebapp/services/local_storage.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceLocalStorage().getInstance();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}
