import 'package:flutter/material.dart';
import 'package:unit/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   void setupWorldTime() async{
     WorldTime mera = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
     await mera.getTime();

     Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location': mera.location,
       'flag': mera.flag,
       'time': mera.time,
       'date': mera.date,
       'isDaytime': mera.isDaytime,
     });
   }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Please wait! Data is fetching",
            style: TextStyle( fontSize: 30),),
            SpinKitCircle(
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      )
    );
  }
}
