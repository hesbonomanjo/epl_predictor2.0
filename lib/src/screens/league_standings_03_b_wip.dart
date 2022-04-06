import 'dart:convert';
import 'dart:io';
import 'package:epl_predictor/src/screens/selected_fixture_04.dart';
import 'package:epl_predictor/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../models/fixtures_today.dart';
import 'package:flutter/services.dart';
import 'package:epl_predictor/src/models/league_standings_data.dart';

class LeagueStandings extends StatefulWidget {
  final String selectedLeagueID, selectedLeagueName, season;

  const LeagueStandings(
      {Key? key,
      required this.season,
      required this.selectedLeagueID,
      required this.selectedLeagueName})
      : super(key: key);

  @override
  State<LeagueStandings> createState() => _LeagueStandingsState();
}

class _LeagueStandingsState extends State<LeagueStandings> {
  bool isLoading = false;
  List leagueStandingsData = [];
  // DateTime currentDate = DateTime.now();
  List noOfStandings = [];
  // int? fixtureID;
  // String? fixtureDate, home, away;
  int? rank, played, win, draw, lose, gf, ga, points;
  String? name, form;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   fixturesList.clear();
  //   final DateTime? pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: currentDate,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2050));
  //   if (pickedDate != null && pickedDate != currentDate)
  //     setState(() {
  //       currentDate = pickedDate;
  //       getData();
  //     });
  // }

//************************************************ */
  // Future getData() async {
  // setState(() {
  //   isLoading = true; //Data is loading
  // });
  //   HttpClient httpClient = HttpClient();

  //   // String url = Constants.uriFixtures(currentDate.toString().substring(0, 10),
  //   //     widget.selectedLeagueID, widget.season);
  //   String url = Constants.uriStandings(widget.season, widget.selectedLeagueID);
  //   //tring url = Constants.uriFixturesPredictions('592241');
  //   //print(url);

  //   httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
  //     // request.headers.set('x-rapidapi-host', Constants.apiHostBeta);
  //     request.headers.set('x-rapidapi-host', Constants.apiHost);
  //     request.headers.set('x-rapidapi-key', Constants.apiKey);

  //     return request.close();
  //   }).then((HttpClientResponse? response) async {
  //     if (response != null) {
  //       var json = await response.transform(utf8.decoder).join();

  //       noOfStandings = jsonDecode(json)['response'][0]['league']['standings'];
  //       print(noOfStandings);
  // for (int i = 0; i < noOfStandings; i++) {
  //   fixtureID = jsonDecode(json)['standings'][i]['rank']['id'];
  //   fixtureDate = jsonDecode(json)['response'][i]['fixture']['date'];
  //   home = jsonDecode(json)['response'][i]['teams']['home']['name'];
  //   away = jsonDecode(json)['response'][i]['teams']['away']['name'];

  //   FixturesToday fixtureToday$i =
  //       FixturesToday(fixtureID, fixtureDate, home, away);

  //   // print(fixtureToday$i);
  //   fixturesList.add(fixtureToday$i);
  // }
  
// ---------*******************************************
  Future getData() async {
    setState(() {
      isLoading = true; //Data is loading
    });
    final String response =
        await rootBundle.loadString('lib/src/assets/upl.json');
    final data = await json.decode(response);
    // print(data);
    noOfStandings = data['response'][0]['league']['standings'][0];
    // print(noOfStandings.length);

    for (int i = 0; i < noOfStandings.length; i++) {
      rank = data['response'][0]['league']['standings'][0][i]['rank'];
      name = data['response'][0]['league']['standings'][0][i]['team']['name'];
      played =
          data['response'][0]['league']['standings'][0][i]['all']['played'];
      win = data['response'][0]['league']['standings'][0][i]['all']['win'];
      draw = data['response'][0]['league']['standings'][0][i]['all']['draw'];
      lose = data['response'][0]['league']['standings'][0][i]['all']['lose'];
      gf = data['response'][0]['league']['standings'][0][i]['all']['goals']
          ['for'];
      ga = data['response'][0]['league']['standings'][0][i]['all']['goals']
          ['against'];
      points = data['response'][0]['league']['standings'][0][i]['points'];
      form = data['response'][0]['league']['standings'][0][i]['form'];
      // var update = data[i]['update'];

      // print(
      //     '$rank , $name, $played ,$win, $draw, $lose , $gf:$ga, $form , $points');

      LeagueStandingsData leagueStandingsData$i = LeagueStandingsData(
          rank, name, played, win, draw, lose, gf, ga, points, form);

      // print(leagueStandingsData$i);
      leagueStandingsData.add(leagueStandingsData$i);
    }

    setState(() {
      isLoading = false; //Data has loaded
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
                    Container(
                      // color: Colors.red,
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const[
                          Text('#'),
                          SizedBox(width:5),
                          Text('Team')
                        ],
                        ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:const[
                          Text('P'),
                          SizedBox(width:5),
                          Text('W'),
                          SizedBox(width:5),
                          Text('D'),
                          SizedBox(width:5),
                          Text('L'),
                          SizedBox(width:5),
                          Text('Goals'),
                          SizedBox(width:5),
                          Text('PTS',style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                        ),
                       const Text('Form'),
                      ],),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * .65,
                      color: Colors.grey[200],
                      child: Scrollbar(
                        thickness: 20,
                        child: ListView.builder(
                            itemCount: noOfStandings.length,
                            itemBuilder: (context, int index) {
                              // //String fixtureID, gameTime, home, away;
                              // //'${tempFixture[1].substring(12, 5)} HRS'
                              List<String> tempStandings =
                                  leagueStandingsData[index]
                                      .toString()
                                      .split(',');
                              String partA =
                                  tempStandings[0] + ' '+tempStandings[1];
                             String partB =
                                  tempStandings[2] + ' '+tempStandings[3] + ' '+tempStandings[4] + ' '+tempStandings[5] + ' '+tempStandings[6] + ' '+tempStandings[7];
                              String partC =
                                  tempStandings[8];
                              return ListTile(
                                leading: Text(partA),
                                title: Text(partB,
                                  textAlign: TextAlign.start,
                                ),
                                // trailing: const Icon(Icons.navigate_next),
                                trailing: Text(partC),
                                onTap: () {},
                                // onTap: () {
                                //   //TODO: Enter parameters here
                                //   String selectedFixture =
                                //       tempFixture[0].substring(1);
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => SelectedFixture(
                                //                 selectedFixtureID:
                                //                     selectedFixture,
                                //                 time: leadingString,
                                //               )));

                                //   // print(
                                //   //   'Fixture ID is ${tempFixture[0].toString().substring(1)}');
                                // },
                              );
                            }),
                      ),
                    ),
                    //   const SizedBox(height: 10),
                    //   ElevatedButton(
                    //     child: const Text(
                    //       'SELECT ANOTHER FIXTURE DATE',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.black54, // background
                    //       onPrimary: Colors.white, // foreground
                    //     ),
                    //     onPressed: () => _selectDate(context),
                    //   ),
                    //   const SizedBox(height: 10),
                    //   ElevatedButton(
                    //     child: const Text(
                    //       'LEAGUE STANDINGS',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.black54, // background
                    //       onPrimary: Colors.white, // foreground
                    //     ),
                    //     onPressed: () => Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => LeagueStandings(
                    //                   selectedLeagueID: widget.selectedLeagueID,
                    //                   selectedLeagueName:
                    //                       widget.selectedLeagueName,
                    //                   season: widget.season,
                    //                 ))),
                    //   ),
                  ],
                ),
              ),
            ),
    );
  }
}
