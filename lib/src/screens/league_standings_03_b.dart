import 'dart:convert';
import 'dart:io';
import 'package:epl_predictor/src/utilities/constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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
  List noOfStandings = [0];
  int? rank, played, win, draw, lose, gf, ga, points;
  String? name, form;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    setState(() {
      isLoading = true; //Data is loading
    });
    HttpClient httpClient = HttpClient();

    // String url = Constants.uriFixtures(currentDate.toString().substring(0, 10),
    //     widget.selectedLeagueID, widget.season);
    String url = Constants.uriStandings(widget.season, widget.selectedLeagueID);

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
        // print('From Constants: $json');

        noOfStandings =
            jsonDecode(json)['response'][0]['league']['standings'][0];
        // print('Number of Standings is : $noOfStandings');
        // for (int i = 0; i < noOfStandings.length; i++) {
        for (int i = 0; i < noOfStandings.length; i++) {
          rank = jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['rank'];
          name = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['team']['name']);

          played = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['all']['played']);
          win = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['all']['win']);
          draw = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['all']['draw']);
          lose = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['all']['lose']);
          gf = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['all']['goals']['for']);
          ga = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['all']['goals']['against']);
          points = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['points']);
          form = (jsonDecode(json)['response'][0]['league']['standings'][0][i]
              ['form']);

          // print('$rank, $name, $played, $win, $draw, $lose, $gf, $ga, $points, $form');

          LeagueStandingsData leagueStandingsData$i = LeagueStandingsData(
              rank, name, played, win, draw, lose, gf, ga, points, form);

          // print(leagueStandingsData$i);
          leagueStandingsData.add(leagueStandingsData$i);
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
                    SizedBox(
                      // color: Colors.red,
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('#'),
                              SizedBox(width: 5),
                              Text('Team')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('P'),
                              SizedBox(width: 5),
                              Text('W'),
                              SizedBox(width: 5),
                              Text('D'),
                              SizedBox(width: 5),
                              Text('L'),
                              SizedBox(width: 5),
                              Text('Goals'),
                              SizedBox(width: 5),
                              Text('PTS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          const Text('Form'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .65,
                      // color: Colors.grey[200],
                      child: Scrollbar(
                        thickness: 20,
                        child: ListView.builder(
                            itemCount: noOfStandings.length,
                            itemBuilder: (context, int index) {
                              // print('Checked in ok : ${noOfStandings.length}');
                              // //String fixtureID, gameTime, home, away;
                              // //'${tempFixture[1].substring(12, 5)} HRS'
                              List<String> tempStandings =
                                  leagueStandingsData[index]
                                      .toString()
                                      .split(',');
                              String partA =
                                  tempStandings[0] + ' ' + tempStandings[1];
                              String partB = tempStandings[2] +
                                  ' ' +
                                  tempStandings[3] +
                                  ' ' +
                                  tempStandings[4] +
                                  ' ' +
                                  tempStandings[5] +
                                  ' ' +
                                  tempStandings[6] +
                                  ' ' +
                                  tempStandings[7];
                              String partC = tempStandings[8];
                              return ListTile(
                                leading: Text(partA),
                                title: Text(
                                  partB,
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
