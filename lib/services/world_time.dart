import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String placeURL;
  late bool isDaytime;
  WorldTime(
      {required this.location, required this.flag, required this.placeURL});

  Future<String> getTime() async {
    try {
      var url = Uri.parse(
          'http://worldtimeapi.org/api/timezone/$placeURL'); //parsing the url
      var response = await http.get(url); //waiting for the response
      //converting the json data into map data
      var data =
          jsonDecode(response.body); //var can also be used instead of Map

      // settting variables

      String offset = data['utc_offset'].substring(1, 3); //error in hour
      String offset2 = data['utc_offset'].substring(4, 6); //error in minutes
      DateTime now = DateTime.parse(data['datetime']); //grabbing real time
      // taking real time and adding it with the offsets
      now = now
          .add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
      return time;
    } catch (e) {
      return time = 'Invalid parameter passed';
    }
  }
}
