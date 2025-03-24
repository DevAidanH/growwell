import 'package:flutter/material.dart';
import 'package:growwell/Models/datetime.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:provider/provider.dart';

class Additem extends StatefulWidget {
  const Additem({super.key});

  @override
  State<Additem> createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  final newPlantNameController = TextEditingController();
  DateTime? selectedDate;

  void addPlant(){
    if(selectedDate == null){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Please select a date before adding a new plant"),
        actions: [
          MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        )
        ]
      ));
    }else{
      String newPlant = newPlantNameController.text;
      String upcomingDate = convertDateTimeToYYYYMMDD(selectedDate);
      Provider.of<PlantData>(context, listen: false).addPlant(newPlant, upcomingDate, context);
      newPlantNameController.clear();
    }
  }

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add a new plant"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: newPlantNameController,
              decoration: InputDecoration(border: UnderlineInputBorder(), labelText: "Enter your plant name here..."),
            ),
          ),
          Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
          ),
          OutlinedButton(onPressed: _selectDate, child: const Text('Select Date')),
          MaterialButton(
            onPressed: addPlant,
            child: Text("Add"),
          )
        ],
      ),
    );
  }
}