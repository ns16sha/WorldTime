import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String date;
  String flag;
  String url;
  bool isDaytime;
  WorldTime({this.location,this.flag, this.url});

  Future<void> getTime() async {
    try{
      //make api request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      
      //getting properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      String offset2 = data['utc_offset'].substring(4, 6);
      //Create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));
      print(now);
      isDaytime = now.hour > 5 && now.hour < 20;
      time = DateFormat.jm().format(now);
      date = DateFormat('dd-MM-yyyy').format(now);
      print(date);
    }
    catch (e)
    {
      print('error caught: $e');
      time = 'Could not get data';

    }

  }
}
