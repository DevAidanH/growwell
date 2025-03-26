import 'package:flutter/material.dart';
import 'package:growwell/Pages/addItem.dart';
import 'package:growwell/components/plantTile.dart';
import 'package:growwell/data/plant_data.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void initState(){
      super.initState();

      Provider.of<PlantData>(context, listen: false).initPlantList();
    }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantData>(
      builder: (context, value, child) =>Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("GrowWell"),
        ),
        body: Column(
          children: [
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Additem()));
              },
              child: Text("Add Plant"),
            ),
            ListView.builder(
              shrinkWrap: true, 
              padding: EdgeInsets.all(30),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getPlantList().length,
              itemBuilder: (context, index) => Planttile(plantName: value.getPlantList()[index].name, date: value.getPlantList()[index].upcomingDate,)
            ),
          ],
        ),
      )
    );
  }
}