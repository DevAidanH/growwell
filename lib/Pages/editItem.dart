import 'package:flutter/material.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Edititem extends StatelessWidget {
  String plantName;
  
  Edititem({required this.plantName, super.key});

  @override
  Widget build(BuildContext context) {
    final editPlantNameController = TextEditingController(text: plantName);

    return Consumer<PlantData>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(plantName)
      ),
      body: Column(
        children: [
          ListTile(
            title: TextField(
                controller: editPlantNameController,
              ),
              trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      onPressed: () => value.editPlant(plantName, editPlantNameController.text, context),
                    child: Text("Save name"),)
                  ]
              )
          ),
          Text(value.getDate(plantName)),
          MaterialButton(
            onPressed: () => value.deletePlant(plantName, context),
            child: Text("Delete"),
          )
        ],
      )
    ));
  }
}