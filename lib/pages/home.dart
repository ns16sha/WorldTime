import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    print(data);
    String bmage = data['isDaytime'] ? 'day1.jpg' : 'night2.jpg';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bmage'), fit: BoxFit.fill)),
        child: SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   if(result != null)
                   setState(() {
                     data = {
                       'time': result['time'],
                       'date': result['date'],
                       'location': result['location'],
                       'isDaytime': result['isDaytime'],
                       'flag': result['flag']
                     };
                   });
                  },
                  icon: Icon(Icons.edit_location,
                  color: Colors.grey[200]),
                  label: Text('Edit Location',
                    style: TextStyle(color: Colors.grey[200]),)
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 2.0, color: Colors.grey[200]),
                  )
                ]),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 50, color: Colors.grey[200]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['date'],
                style: TextStyle(fontSize: 20, color: Colors.grey[200]),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
