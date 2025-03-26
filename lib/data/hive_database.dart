import 'package:growwell/Models/datetime.dart';
import 'package:growwell/Models/plant.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  final _myBox = Hive.box("plant_database1");

  //Check if there is data stored
  bool previousDataExists(){
    if(_myBox.isEmpty){
      _myBox.put("START_DATE", todaysDateYYYYMMDD());
      return false;
    }
    else{
      return true;
    }
  }

  //Return start date
  String getStartDate(){
    return _myBox.get("START_DATE");
  }

  //Write data to storage
  void saveToDatabase(List<Plant> plants){
    final plantList = convertObjectToList(plants);
    _myBox.put("PLANTS", plantList);
  }

  //Read from storage
  List<Plant> readFromDatabase(){
    List<Plant> myPlants = [];
    List<String> savedPlants = _myBox.get("PLANTS");
    
    for(int i=0; i < savedPlants.length; i++){
      String name = savedPlants[i].substring(0, savedPlants[i].length - 8);
      String date = savedPlants[i].substring(savedPlants[i].length - 8);
      print(name);
      print(date);
      myPlants.add(Plant(name: name, upcomingDate: date));
    }

    return myPlants;
  } 

  //Convert object to string
  List<String> convertObjectToList(List<Plant> plants){
    List<String> plantList = [];
    for(int i = 0; i < plants.length; i++){
      String plant = plants[i].name + plants[i].upcomingDate;
      plantList.add(plant); //Need to fix naming
    }
    return plantList;
  }
}