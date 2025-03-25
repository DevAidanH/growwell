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
  DateTime? selectedDate;
  DateTime tempDate = DateTime.now();

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
                    child: Column(
                      children: [
                        Text("Well Done! You've kept this plant alive again!"),
                        Text("When will this plant need water again"),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: (){
                                selectedDate = DateTime(tempDate.year, tempDate.month, tempDate.day + 1);

                                setState(() {
                                  selectedDate = selectedDate;
                                });
                              }, 
                              child: Text("1 Day")
                            ),
                            MaterialButton(
                              onPressed: (){
                                selectedDate = DateTime(tempDate.year, tempDate.month, tempDate.day + 7);

                                setState(() {
                                  selectedDate = selectedDate;
                                });
                              }, 
                              child: Text("1 Week")
                            ),
                            MaterialButton(
                              onPressed: (){
                                selectedDate = DateTime(tempDate.year, tempDate.month + 1, tempDate.day);

                                setState(() {
                                  selectedDate = selectedDate;
                                });
                              }, 
                              child: Text("1 Month")
                            ),
                          ],
                        ),
                        Text("Or please select a date"),
                        Text(
                          selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'No date selected',
                        ),
                        MaterialButton(onPressed: _selectDate, child: const Text('Select Date')),
                        MaterialButton(onPressed: () => value.updateDate(widget.plantName, selectedDate, context), child: Text("Save"),)
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    ));
  }
}