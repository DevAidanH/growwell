import 'package:flutter/material.dart';
import 'package:growwell/Pages/splash.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MainApp());

  await Hive.initFlutter();
  await Hive.openBox("plant_database1");
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
