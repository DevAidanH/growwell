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
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
  }
  
  /*void waterPlant(name, context){
    DateTime? selectedDate;
    Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030), //Fix date range here
    );
      setState(() {
        selectedDate = pickedDate;
      });
    }

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Well Done! You kept this plant alive! Please select when this plant will need water again"),
      content: Text(selectedDate != null
                    ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                    : 'No date selected',
                ),
      actions: [
          OutlinedButton(onPressed: _selectDate, child: const Text('Select Date')),
      ],
    ));
  }*/
}