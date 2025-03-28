import 'package:flutter/material.dart';
import 'package:growwell/Models/datetime.dart';
import 'package:growwell/Pages/editItem.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Planttile extends StatelessWidget {
  String plantName;
  String date;

  Planttile({required this.plantName, required this. date, super.key});

  @override
  Widget build(BuildContext context) {

    String dateOutput(){
      String output = "";
      int days = createDateTimeObject(date).difference(DateTime.now()).inDays;
      if(days < 1){
        output = "Overdue!";
      }
      else if(days == 1){
        output = "Due tomorrow";
      }
      else{
        output = "$days days remaining";
      }
      return output;
    }

    return Consumer<PlantData>(
      builder: (context, value, child) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Row(
            children: [Text(plantName.toUpperCase())]
          ),
          subtitle: Row(
            children: [
              Text(dateOutput()),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Edititem(plantName: plantName,)));
                  },
                child: Text("View")
              )
            ],
          ),
        ),
      )
    );
  }
}