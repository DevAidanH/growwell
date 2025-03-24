//Default plant list
import 'package:flutter/material.dart';
import 'package:growwell/Models/datetime.dart';
import 'package:growwell/Models/plant.dart';
import 'package:growwell/Pages/homepage.dart';

class PlantData extends ChangeNotifier {

  List<Plant> plantList = [
    Plant(
      name: "Snake Plant",
      upcomingDate: todaysDateYYYYMMDD()
    ),
    Plant(
      name: "House Plant",
      upcomingDate: todaysDateYYYYMMDD()
    )
  ];

  void initPlantList(){

  }

   List<Plant> getPlantList(){
    return plantList;
  }

  Plant getRelevantPlant(name){
    print(name);
    Plant relevantPlant = plantList.firstWhere((plant) => plant.name == name); //Currently broken...unsure why
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
    notifyListeners();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));

  }

  void deletePlant(name, context){
    Plant relevantPlant = getRelevantPlant(name);
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Are you sure you want to delete this plant?"),
      actions: [
        MaterialButton(
          onPressed: (){
            plantList.remove(relevantPlant);
            notifyListeners();
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
    notifyListeners();
  }

  void editPlant(name, newName, context){
    Plant relevantPlant = getRelevantPlant(name);
    relevantPlant.name = newName;
    notifyListeners();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  
}