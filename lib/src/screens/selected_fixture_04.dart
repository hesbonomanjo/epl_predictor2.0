//THIS IS THE 3RD LANDING PAGE

import 'package:epl_predictor/src/screens/analytics_05.dart';
import 'package:epl_predictor/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class SelectedFixture extends StatefulWidget {
  final String selectedFixtureID, time;

  SelectedFixture(
      {/*required*/ required this.selectedFixtureID,
      /*required*/ required this.time});

  @override
  _SelectedFixtureState createState() => _SelectedFixtureState();
}

class _SelectedFixtureState extends State<SelectedFixture> {
  bool isLoading = false;
  String? homeTeam = '', awayTeam = '', winningTeam, advice;
  String? homeGoals,
      awayGoals,
      homePercentCurrent,
      drawPercentCurrent,
      awayPercentCurrent;
  String? homeLast5Form,
      homeLast5Att,
      homeLast5Def,
      awayLast5Form,
      awayLast5Att,
      awayLast5Def;
  var homeLastGoalsFor,
      homeLastGoalsAgainst,
      awayLastGoalsFor,
      awayLastGoalsAgainst;
  var homeLastGoalsForAvg,
      homeLastGoalsAgainstAvg,
      awayLastGoalsForAvg,
      awayLastGoalsAgainstAvg,
      homeForm,
      awayForm,
      homeGPH,
      awayGPH,
      homeGPA,
      awayGPA,
      homeWH,
      awayWH,
      homeWA,
      awayWA,
      homeDH,
      awayDH,
      homeDA,
      awayDA,
      homeLH,
      awayLH,
      homeLA,
      awayLA,
      homeGFH,
      awayGFH,
      homeGFA,
      awayGFA,
      homeGAH,
      awayGAH,
      homeGAA,
      awayGAA,
      homeCleanSheetH,
      awayCleanSheetH,
      homeCleanSheetA,
      awayCleanSheetA,
      homeFailedToScoreH,
      awayFailedToScoreH,
      homeFailedToScoreA,
      awayFailedToScoreA;
  var formComparisonH,
      formComparisonA,
      formAttackH,
      formAttackA,
      formDefenceH,
      formDefenceA,
      formPoissonDistH,
      formPoissonDistA,
      h2hH,
      h2hA,
      goalsH,
      goalsA,
      overallH,
      overallA;

  @override
  void initState() {
    String selectedFixture = widget.selectedFixtureID;

    getData(selectedFixture);
    super.initState();

    //print(selectedFixture);
  }

  Future getData(selectedFixture) async {
    setState(() {
      isLoading = true; //Data has loaded
    });
    HttpClient httpClient = HttpClient();

    String url = Constants.uriFixturesPredictions(selectedFixture);
    print(selectedFixture);

    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      request.headers.set('x-rapidapi-host', Constants.apiHostBeta);
      request.headers.set('x-rapidapi-key', Constants.apiKey);

      return request.close();
    }).then((HttpClientResponse response) async {
      var json = await response.transform(utf8.decoder).join();
      //print('From Constants: $json');
      //print(json);
      winningTeam =
          jsonDecode(json)['response'][0]['predictions']['winner']['name'];
      homeGoals =
          jsonDecode(json)['response'][0]['predictions']['goals']['home'];
      awayGoals =
          jsonDecode(json)['response'][0]['predictions']['goals']['away'];
      advice = jsonDecode(json)['response'][0]['predictions']['advice'];
      homePercentCurrent =
          jsonDecode(json)['response'][0]['predictions']['percent']['home'];
      drawPercentCurrent =
          jsonDecode(json)['response'][0]['predictions']['percent']['draw'];
      awayPercentCurrent =
          jsonDecode(json)['response'][0]['predictions']['percent']['away'];
      //-----------------------------HOME-----------------------
      homeTeam = jsonDecode(json)['response'][0]['teams']['home']['name'];
      homeLast5Form =
          jsonDecode(json)['response'][0]['teams']['home']['last_5']['form'];
      homeLast5Att =
          jsonDecode(json)['response'][0]['teams']['home']['last_5']['att'];
      homeLast5Def =
          jsonDecode(json)['response'][0]['teams']['home']['last_5']['def'];
      homeLastGoalsFor = jsonDecode(json)['response'][0]['teams']['home']
          ['last_5']['goals']['for']['total'];
      homeLastGoalsForAvg = jsonDecode(json)['response'][0]['teams']['home']
          ['last_5']['goals']['for']['average'];
      homeLastGoalsAgainst = jsonDecode(json)['response'][0]['teams']['home']
          ['last_5']['goals']['against']['total'];
      homeLastGoalsAgainstAvg = jsonDecode(json)['response'][0]['teams']['home']
          ['last_5']['goals']['against']['average'];
      homeForm =
          jsonDecode(json)['response'][0]['teams']['home']['league']['form'];
      homeGPH = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['played']['home'];
      homeGPA = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['played']['away'];
      homeWH = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['wins']['home'];
      homeWA = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['wins']['away'];
      homeDH = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['draws']['home'];
      homeDA = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['draws']['away'];
      homeLH = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['loses']['home'];
      homeLA = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['fixtures']['loses']['away'];
      homeGFH = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['goals']['for']['total']['home'];
      homeGFA = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['goals']['for']['total']['away'];
      homeGAH = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['goals']['against']['total']['home'];
      homeGAA = jsonDecode(json)['response'][0]['teams']['home']['league']
          ['goals']['against']['total']['away'];
      homeCleanSheetH = jsonDecode(json)['response'][0]['teams']['home']
          ['league']['clean_sheet']['home'];
      homeCleanSheetA = jsonDecode(json)['response'][0]['teams']['home']
          ['league']['clean_sheet']['away'];
      homeFailedToScoreH = jsonDecode(json)['response'][0]['teams']['home']
          ['league']['failed_to_score']['home'];
      homeFailedToScoreA = jsonDecode(json)['response'][0]['teams']['home']
          ['league']['failed_to_score']['away'];
      //------------------------------AWAY-----------------------
      awayTeam = jsonDecode(json)['response'][0]['teams']['away']['name'];
      awayLast5Form =
          jsonDecode(json)['response'][0]['teams']['away']['last_5']['form'];
      awayLast5Att =
          jsonDecode(json)['response'][0]['teams']['away']['last_5']['att'];
      awayLast5Def =
          jsonDecode(json)['response'][0]['teams']['away']['last_5']['def'];
      awayLastGoalsFor = jsonDecode(json)['response'][0]['teams']['away']
          ['last_5']['goals']['for']['total'];
      awayLastGoalsForAvg = jsonDecode(json)['response'][0]['teams']['away']
          ['last_5']['goals']['for']['average'];
      awayLastGoalsAgainst = jsonDecode(json)['response'][0]['teams']['away']
          ['last_5']['goals']['against']['total'];
      awayLastGoalsAgainstAvg = jsonDecode(json)['response'][0]['teams']['away']
          ['last_5']['goals']['against']['average'];
      awayForm =
          jsonDecode(json)['response'][0]['teams']['away']['league']['form'];
      awayGPH = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['played']['home'];
      awayGPA = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['played']['away'];
      awayWH = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['wins']['home'];
      awayWA = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['wins']['away'];
      awayDH = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['draws']['home'];
      awayDA = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['draws']['away'];
      awayLH = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['loses']['home'];
      awayLA = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['fixtures']['loses']['away'];
      awayGFH = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['goals']['for']['total']['home'];
      awayGFA = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['goals']['for']['total']['away'];
      awayGAH = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['goals']['against']['total']['home'];
      awayGAA = jsonDecode(json)['response'][0]['teams']['away']['league']
          ['goals']['against']['total']['away'];
      awayCleanSheetH = jsonDecode(json)['response'][0]['teams']['away']
          ['league']['clean_sheet']['home'];
      awayCleanSheetA = jsonDecode(json)['response'][0]['teams']['away']
          ['league']['clean_sheet']['away'];
      awayFailedToScoreH = jsonDecode(json)['response'][0]['teams']['away']
          ['league']['failed_to_score']['home'];
      awayFailedToScoreA = jsonDecode(json)['response'][0]['teams']['away']
          ['league']['failed_to_score']['away'];
      //------------------------COMPARISON---------------
      formComparisonH =
          jsonDecode(json)['response'][0]['comparison']['form']['home'];
      formComparisonA =
          jsonDecode(json)['response'][0]['comparison']['form']['away'];
      formAttackH =
          jsonDecode(json)['response'][0]['comparison']['att']['home'];
      formAttackA =
          jsonDecode(json)['response'][0]['comparison']['att']['away'];
      formDefenceH =
          jsonDecode(json)['response'][0]['comparison']['def']['home'];
      formDefenceA =
          jsonDecode(json)['response'][0]['comparison']['def']['away'];
      formPoissonDistH = jsonDecode(json)['response'][0]['comparison']
          ['poisson_distribution']['home'];
      formPoissonDistA = jsonDecode(json)['response'][0]['comparison']
          ['poisson_distribution']['away'];
      h2hH = jsonDecode(json)['response'][0]['comparison']['h2h']['home'];
      h2hA = jsonDecode(json)['response'][0]['comparison']['h2h']['away'];
      goalsH = jsonDecode(json)['response'][0]['comparison']['goals']['home'];
      goalsA = jsonDecode(json)['response'][0]['comparison']['goals']['away'];
      overallH = jsonDecode(json)['response'][0]['comparison']['total']['home'];
      overallA = jsonDecode(json)['response'][0]['comparison']['total']['away'];

      //TODO: Add h2h Comparison for last 10
      setState(() {
        isLoading = false;
      });
    }); //print(fixturesList);
  }

  @override
  Widget build(BuildContext context) {
    String time = widget.time;

    return Scaffold(
        appBar: AppBar(
          title: Text(homeTeam == '' || awayTeam == ''
              ? 'Loading...'
              : '$homeTeam vs $awayTeam  $time HRS'),
        ),
        //body: Text('Selected Fixture is: ${widget.selectedFixtureID}'),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      'Predicted to win: $winningTeam',
                      style: TextStyle(fontSize: 20),
                    ),
                    Divider(height: 2, thickness: 3),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PREDICTED GOALS',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(child: Text('Home = $homeGoals')),
                              Container(child: Text('Away = $awayGoals')),
                            ],
                          ),
                          Divider(height: 2, thickness: 3),
                          Text('ADVICE : $advice',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Divider(height: 2, thickness: 3),
                        ]),
                    Text('OVERALL PREDICTION:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Home %',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Draw %',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Away %',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(homePercentCurrent ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(drawPercentCurrent ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(awayPercentCurrent ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(height: 2, thickness: 3),
                    Text('LAST FIVE GAMES:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                  color: Colors.blue, child: Text('HOME')),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Form %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Attack %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Defence %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(homeLast5Form ?? ''),
                                  SizedBox(width: 10),
                                  Text(homeLast5Att ?? ''),
                                  SizedBox(width: 10),
                                  Text(homeLast5Def ?? ''),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Goals For:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Average',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('   '),
                                  SizedBox(width: 10),
                                  Text(homeLastGoalsFor.toString()),
                                  SizedBox(width: 10),
                                  Text(homeLastGoalsForAvg.toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Goals Against:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Average',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('   '),
                                  SizedBox(width: 10),
                                  Text(homeLastGoalsAgainst.toString()),
                                  SizedBox(width: 10),
                                  Text(homeLastGoalsAgainstAvg.toString()),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  color: Colors.green, child: Text('AWAY')),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: 10),
                                  Text('Form %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Attack %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Defence %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(awayLast5Form ?? ''),
                                  SizedBox(width: 10),
                                  Text(awayLast5Att ?? ''),
                                  SizedBox(width: 10),
                                  Text(awayLast5Def ?? ''),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Goals For:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Average',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('   '),
                                  SizedBox(width: 10),
                                  Text(awayLastGoalsFor.toString()),
                                  SizedBox(width: 10),
                                  Text(awayLastGoalsForAvg.toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: 10),
                                  Text('Goals Against:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Average',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('   '),
                                  SizedBox(width: 10),
                                  Text(awayLastGoalsAgainst.toString()),
                                  SizedBox(width: 10),
                                  Text(awayLastGoalsAgainstAvg.toString()),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 2, thickness: 3),
                    Text('FORM', style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                        child: Text('Home = $homeForm',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Container(
                        child: Text('Away = $awayForm',
                            style: TextStyle(fontWeight: FontWeight.bold))),

                    Divider(height: 2, thickness: 3),
                    Text('COMPARISON',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        //print(formPoissonDistH.substring(0, 2));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Analytics(
                                    homeTeam: homeTeam,
                                    awayTeam: awayTeam,
                                    advice: advice,
                                    formComparisonH: formComparisonH,
                                    formComparisonA: formComparisonA,
                                    formAttackH: formAttackH,
                                    formAttackA: formAttackA,
                                    formDefenceH: formDefenceH,
                                    formDefenceA: formDefenceA,
                                    formPoissonDistH: formPoissonDistH,
                                    formPoissonDistA: formPoissonDistA,
                                    h2hH: h2hH,
                                    h2hA: h2hA,
                                    goalsH: goalsH,
                                    goalsA: goalsA,
                                    overallH: overallH,
                                    overallA: overallA)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(children: [
                                Text('HOME FORM = $formComparisonH'),
                                Text('ATTACK = $formAttackH'),
                                Text('DEFENCE = $formDefenceH'),
                                Text('POISSON = $formPoissonDistH'),
                                Text('H2H = $h2hH'),
                                Text('GOALS HOME = $goalsH'),
                                Text('OVERALL HOME = $overallH',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                              Column(children: [
                                Text('AWAY FORM = $formComparisonA'),
                                Text('ATTACK = $formAttackA'),
                                Text('DEFENCE = $formDefenceA'),
                                Text('POISSON = $formPoissonDistA'),
                                Text('H2H = $h2hA'),
                                Text('GOALS AWAY = $goalsA'),
                                Text('OVERALL AWAY = $overallA',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ])
                            ]),
                      ),
                    ),
                    Divider(height: 2, thickness: 3),
                    Text('GAMES STATISTICS',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [
                          Container(child: Text('HOME'), color: Colors.blue),
                          Text('Played Home = $homeGPH',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Won Home = $homeWH',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Drawn Home = $homeDH',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Lost Home = $homeLH',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Divider(height: 5, thickness: 6),
                          Text('Played Away = $homeGPA'),
                          Text('Won Away = $homeWA'),
                          Text('Drawn Away = $homeDA'),
                          Text('Lost Away = $homeLA'),
                        ]),
                        Column(children: [
                          Container(child: Text('AWAY'), color: Colors.green),
                          Text('Played Home = $awayGPH'),
                          Text('Won Home = $awayWH'),
                          Text('Drawn Home = $awayDH'),
                          Text('Lost Home = $awayLH'),
                          Divider(height: 5, thickness: 6),
                          Text('Played Away = $awayGPA',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Won Away = $awayWA',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Drawn Away = $awayDA',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Lost Away = $awayLA',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                      ],
                    ),
                    Divider(height: 2, thickness: 3),
                    Text('GOALS STATISTICS',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text('Goals For @ Home = $homeGFH',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Goals For @ Away = $homeGFA'),
                            Text('Goals Against @ Home = $homeGAH',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Goals Against @ Away = $homeGAA'),
                          ]),
                          Column(children: [
                            Text('Goals For @ Home = $awayGFH'),
                            Text('Goals For @ Away = $awayGFA',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Goals Against @ Home = $awayGAH'),
                            Text('Goals Against @ Away = $awayGAA',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ])
                        ]),
                    Divider(height: 2, thickness: 3),
                    Text('CLEAN SHEET',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text('Home CS = $homeCleanSheetH',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Away CS = $homeCleanSheetA'),
                          ]),
                          Column(children: [
                            Text('Home CS = $awayCleanSheetH'),
                            Text('Away CS = $awayCleanSheetA',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                        ]),
                    Divider(height: 2, thickness: 3),
                    Text('FAILED TO SCORE',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text('Home FTS = $homeFailedToScoreH',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Away FTS = $homeFailedToScoreA'),
                          ]),
                          Column(children: [
                            Text('Home FTS = $awayFailedToScoreH'),
                            Text('Away FTS = $awayFailedToScoreA',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                        ]),

                    //TODO: Finish up on all variables here.
                  ])));
  }
}
