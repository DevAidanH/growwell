import 'package:flutter/material.dart';
import 'package:growwell/Pages/editItem.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Planttile extends StatelessWidget {
  String plantName;

  Planttile({required this.plantName, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantData>(
      builder: (context, value, child) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), 
            child: Text(plantName.toUpperCase())
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Edititem(plantName: plantName,)));
              },child: Text("View"),)
            ],
          ),
        ),
      )
    );
  }
}