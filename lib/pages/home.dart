import 'package:flutter/material.dart';

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

// set background image
    String bgImage = data['isDaytime'] ? 'day.jfif' : 'night.webp';
    var bgColor = data['isDaytime'] ? Colors.blue[300] : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Center(
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    }, //Navigator.pushnamed is used to navigate between different routes
                    //NOte that a new poage added on top of that page like a stack.
                    label: Text('Edit Location'),
                    icon: Icon(Icons.edit_location),
                    style: TextButton.styleFrom(primary: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 66, letterSpacing: 2, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
