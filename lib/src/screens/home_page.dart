import 'package:epl_predictor/src/screens/stats_page.dart';
import 'package:flutter/material.dart';
import '../utilities/football_clubs.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FootballClubs footballClubs = FootballClubs();

  late String clubOne;
  String? clubTwo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text('Select teams to analyze...',
                  style: TextStyle(fontSize: 25))),
          SizedBox(height: 40),
          DropdownButtonFormField(
              style: TextStyle(color: Colors.black, fontSize: 20),
              items: footballClubs.clubs.map((String club) {
                return DropdownMenuItem<String>(
                  value: club,
                  child: Text(club),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  clubOne = newValue!;
                });
              }),
          SizedBox(height: 40),
          DropdownButtonFormField(
              style: TextStyle(color: Colors.black, fontSize: 20),
              items: footballClubs.clubs.map((String club) {
                return DropdownMenuItem<String>(
                  value: club,
                  child: Text(club),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  clubTwo = newValue;
                });
              }),
          SizedBox(height: 40),
          ElevatedButton(
              child: Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black54, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StatsPage(clubOne: clubOne, clubTwo: clubTwo!)));
              }),
        ],
      )),
    );
  }
}
