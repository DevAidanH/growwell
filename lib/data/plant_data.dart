//Default plant list
import 'package:flutter/material.dart';
import 'package:growwell/Models/datetime.dart';
import 'package:growwell/Models/plant.dart';
import 'package:growwell/Pages/homepage.dart';
import 'package:growwell/data/hive_database.dart';

class PlantData extends ChangeNotifier {

  final db = HiveDatabase();

  List<Plant> plantList = [];

  void initPlantList(){
    if(db.previousDataExists()){
      plantList = db.readFromDatabase();
    }
    else{
      db.saveToDatabase(plantList);
    }
  }

  List<Plant> getPlantList(){
    return plantList;
  }

  Plant getRelevantPlant(String inputName){
    Plant relevantPlant = plantList.firstWhere((plant) => plant.name == inputName); //Breaks if I use the notifyListeners(); code.
    return relevantPlant;
  }

  String getDate(name){
    return getRelevantPlant(name).upcomingDate;
  }

  void addPlant(name, date, context){
    plantList.add(Plant(
      name: name,
      upcomingDate: date
    ));
    db.saveToDatabase(plantList);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));

  }

  void deletePlant(name, context){
    print(name);
    Plant relevantPlant = getRelevantPlant(name);
    print(relevantPlant.name);
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Are you sure you want to delete this plant?"),
      actions: [
        MaterialButton(
          onPressed: (){
            plantList.remove(relevantPlant);
            db.saveToDatabase(plantList);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          child: Text("Delete"),
        ),
        MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
      ],
    ));
  }

  void editPlant(name, newName, context){
    Plant relevantPlant = getRelevantPlant(name);
    relevantPlant.name = newName;
    db.saveToDatabase(plantList);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }
  
  void updateDate(name, date, context){
    Plant relevantPlant = getRelevantPlant(name);
    relevantPlant.upcomingDate = convertDateTimeToYYYYMMDD(date);
    db.saveToDatabase(plantList);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }
}