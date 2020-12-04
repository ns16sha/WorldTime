import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:unit/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'gr'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'in'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'id'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr'),
  ];

  void updatetime(index) async {
    WorldTime mera = locations[index];
    await mera.getTime();

    Navigator.pop(context, {
      'location': mera.location,
      'flag': mera.flag,
      'time': mera.time,
      'isDaytime': mera.isDaytime,
      'date': mera.date,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Choose Location'),
          centerTitle: true,
          elevation: 2,
        ),
        body: Container(
          color: Color(0xffe9e6eb),
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Card(
                      elevation: 0,
                      child: ListTile(
                        onTap: () {
                          updatetime(index);
                        },
                        leading: Flag(
                          '${locations[index].flag}',
                          width: 60,
                          height: 100,
                        ),
                        title: Text(
                          locations[index].location,
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        tileColor: Color(0xffe9e6eb),
                      )),
                );
              }),
        ));
  }
}
