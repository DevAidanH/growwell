import 'package:flutter/material.dart';
import 'package:growwell/Pages/splash.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => PlantData(), 
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Workout Tracker",
      home: Splash(),
    ));
  }
}
