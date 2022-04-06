//CURRENT 2ND LANDING PAGE

import 'dart:convert';
import 'dart:io';
import 'package:epl_predictor/src/screens/selected_fixture_04.dart';
import 'package:epl_predictor/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../models/fixtures_today.dart';
import 'package:epl_predictor/src/screens/league_standings_03_b.dart';

class LeagueFixtures extends StatefulWidget {
  final String selectedLeagueID, selectedLeagueName, season;

  const LeagueFixtures(
      {Key? key,
      required this.selectedLeagueID,
      required this.selectedLeagueName,
      required this.season})
      : super(key: key);

  @override
  _LeagueFixturesState createState() => _LeagueFixturesState();
}

class _LeagueFixturesState extends State<LeagueFixtures> {
  bool isLoading = false;
  List fixturesList = [];
  DateTime currentDate = DateTime.now();
  int noOfFixtures = 0;
  int? fixtureID;
  String? fixtureDate, home, away;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> _selectDate(BuildContext context) async {
    fixturesList.clear();
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        getData();
      });
  }

  Future getData() async {
    setState(() {
      isLoading = true; //Data is loading
    });
    HttpClient httpClient = HttpClient();

    String url = Constants.uriFixtures(currentDate.toString().substring(0, 10),
        widget.selectedLeagueID, widget.season);
    //tring url = Constants.uriFixturesPredictions('592241');
    //print(url);

    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      // request.headers.set('x-rapidapi-host', Constants.apiHostBeta);
      request.headers.set('x-rapidapi-host', Constants.apiHost);
      request.headers.set('x-rapidapi-key', Constants.apiKey);

      return request.close();
    }).then((HttpClientResponse? response) async {
      if (response != null) {
        var json = await response.transform(utf8.decoder).join();
        //print('From Constants: $json');

        noOfFixtures = jsonDecode(json)['results'];
        //print(noOfFixtures);
        for (int i = 0; i < noOfFixtures; i++) {
          fixtureID = jsonDecode(json)['response'][i]['fixture']['id'];
          fixtureDate = jsonDecode(json)['response'][i]['fixture']['date'];
          home = jsonDecode(json)['response'][i]['teams']['home']['name'];
          away = jsonDecode(json)['response'][i]['teams']['away']['name'];

          FixturesToday fixtureToday$i =
              FixturesToday(fixtureID, fixtureDate, home, away);

          // print(fixtureToday$i);
          fixturesList.add(fixtureToday$i);
        }

        //print(fixturesList);

        setState(() {
          isLoading = false; //Data has loaded
        });
      } else {
        print('NULL RETURNED!');
      }
    }).catchError((error, stackTrace) {
      //TODO: Please handle this error better!!
      setState(() {
        isLoading = false; //Data has loaded
      });

      print('NULL RETURNED FROM CATCH $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('Number of Fixtures Today: ${fixturesList.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.selectedLeagueName} Fixtures'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${currentDate.toString().substring(0, 10)} Fixtures',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * .65,
                      color: Colors.grey[200],
                      child: fixturesList.isEmpty
                          ? const Text('No games today',
                              style: TextStyle(fontSize: 25))
                          : Scrollbar(
                              thickness: 20,
                              child: ListView.builder(
                                  itemCount: fixturesList.length,
                                  itemBuilder: (context, int index) {
                                    //String fixtureID, gameTime, home, away;
                                    //'${tempFixture[1].substring(12, 5)} HRS'
                                    List<String> tempFixture =
                                        fixturesList[index]
                                            .toString()
                                            .split(',');

                                    int hr = int.parse(tempFixture[1]
                                        .substring(11, 13)
                                        .toString());
                                    int hrKE = hr + 3;
                                    String min = tempFixture[1]
                                        .substring(14, 16)
                                        .toString();
                                    String leadingString =
                                        hrKE.toString() + ':' + min;

                                    return ListTile(
                                      leading: Text(
                                        '$leadingString HRS',
                                      ),

                                      title: Text(
                                        '${tempFixture[2]} vs ${tempFixture[3]}',
                                        textAlign: TextAlign.start,
                                      ),
                                      trailing: const Icon(Icons.navigate_next),
                                      //'${tempFixture[2].toString()} vs ${tempFixture[3].toString()}'
                                      onTap: () {
                                        //TODO: Enter parameters here
                                        String selectedFixture =
                                            tempFixture[0].substring(1);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectedFixture(
                                                      selectedFixtureID:
                                                          selectedFixture,
                                                      time: leadingString,
                                                    )));

                                        // print(
                                        //   'Fixture ID is ${tempFixture[0].toString().substring(1)}');
                                      },
                                    );
                                  }),
                            ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text(
                        'SELECT ANOTHER FIXTURE DATE',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black54, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () => _selectDate(context),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text(
                        'LEAGUE STANDINGS',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black54, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      // onPressed: () {},
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeagueStandings(
                                    selectedLeagueID: widget.selectedLeagueID,
                                    selectedLeagueName:
                                        widget.selectedLeagueName,
                                    season: widget.season,
                                  ))),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
