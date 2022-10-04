import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        //using class WorldTime
        location: 'India',
        flag: 'Kolkata.png',
        placeURL: 'Asia/Kolkata');
    String temp = await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

//initState only runs 1 time while executing this flutter app
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.black,
          size: 110.0,
        ),
      ),
    );
  }
}
