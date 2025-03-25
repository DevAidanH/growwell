import 'package:flutter/material.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Waterplant extends StatefulWidget {
  final String plantName;
  const Waterplant({required this.plantName, super.key});

  @override
  State<Waterplant> createState() => _WaterplantState();
}

class _WaterplantState extends State<Waterplant> {
  bool isVisible = false;
  
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantData>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.plantName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
                  visible: isVisible,
                  replacement: Container(
                    color: Colors.redAccent,
                    height: 500,
                    width: 300,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => setState(() => isVisible = !isVisible),
                          child: const Text('Add Water'),
                        ),
                      ],
                    ),
                  ),
                  child: Container(
                    color: Colors.blueAccent,
                    height: 500,
                    width: 300,
                  ),
            ),
          ],
        ),
      ),
    ));
  }
}