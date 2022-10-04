import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // dummy data
  List<WorldTime> locations = [
    WorldTime(
        //using class WorldTime
        location: 'India',
        flag: 'india.png',
        placeURL: 'Asia/Kolkata'),
    WorldTime(placeURL: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(placeURL: 'Asia/Tokyo', location: 'Japan', flag: 'japan.png'),
    WorldTime(placeURL: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.png'),
    WorldTime(placeURL: 'Asia/Qatar', location: 'Qatar', flag: 'qatar.png'),
    WorldTime(
        placeURL: 'Asia/Hong_Kong',
        location: 'Hong_Kong',
        flag: 'hongKong.png'),
    WorldTime(
        placeURL: 'Australia/Sydney',
        location: 'Sydney',
        flag: 'australia.png'),
    WorldTime(
        placeURL: 'Europe/Berlin', location: 'Greece', flag: 'greece.png'),
    WorldTime(placeURL: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        placeURL: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(
        placeURL: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(
        placeURL: 'Asia/Seoul',
        location: 'South Korea',
        flag: 'south_korea.png'),
    WorldTime(
        placeURL: 'Asia/Jakarta', location: 'Indonesia', flag: 'indonesia.png'),
  ];

//passing data back to the home screen when a country is choosen, with the help of that countries index
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose your location',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      //ListView builder works like map function. It loops through every index and returns an widget with it.
      body: ListView.builder(
          itemCount: locations.length, //TO declare an endpoint for the loop
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
