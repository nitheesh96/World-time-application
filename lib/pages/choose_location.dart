import 'package:flutter/material.dart';
import 'package:untitled7/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(done: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(done: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(done: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(done: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(done: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(done: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(done: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(done: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void UpdateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
       appBar: AppBar(
         backgroundColor: Colors.blue[900],
         title: Text('Choose a Location'),
         centerTitle: true,
         elevation: 0,
       ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
       child: Card(
         child: ListTile(
           onTap:  () {
             UpdateTime(index);
           },
           title: Text(locations[index].location),
           leading: CircleAvatar(
             backgroundImage: AssetImage('assets/${locations[index].flag}'),
           ),
         ),
       ),
     );
        }

      ),
    );
  }
}
