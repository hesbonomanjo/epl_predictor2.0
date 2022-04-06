import 'dart:ui';
import 'package:epl_predictor/src/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../utilities/football_clubs.dart';
import 'dart:convert';
import 'dart:io';

//This oage is the old design of stats where you select two teams and get a feel of strength.
class StatsPage extends StatefulWidget {
  final String clubOne, clubTwo;

  StatsPage(
      {/*required*/ required this.clubOne, /*required*/ required this.clubTwo});

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  bool isLoading = false;
  String? clubOneID, clubTwoID;
  String? form1, form2;
  int? rank1, rank2, points1, points2, gd1, gd2;
  int? thp1, tap1, tgp1, thp2, tap2, tgp2;
  int? thw1, taw1, tgw1, thw2, taw2, tgw2;
  int? thd1, tad1, tgd1, thd2, tad2, tgd2;
  int? thl1, tal1, tgl1, thl2, tal2, tgl2;
  int? gfh1, gfa1, gft1, gfh2, gfa2, gft2;
  int? gah1, gaa1, gat1, gah2, gaa2, gat2;

  @override
  void initState() {
    FootballClubs footballClubs = FootballClubs();
    clubOneID = footballClubs.clubID[widget.clubOne];
    clubTwoID = footballClubs.clubID[widget.clubTwo];
    getJson1(clubOneID);
    getJson2(clubTwoID);

    super.initState();
  }
//TODO: Unfortunately we have to do two methods for this !! Goodness!!

  Future getJson1(String? clubID) async {
    HttpClient httpClient = HttpClient();

    setState(() {
      isLoading = true; //Loading Data
    });

    String url = Constants.getUriString(clubID);

    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      request.headers.set('x-rapidapi-host', Constants.apiHostBeta);
      request.headers.set('x-rapidapi-key', Constants.apiKey);

      return request.close();
    }).then((HttpClientResponse response) async {
      var json = await response.transform(utf8.decoder).join();
      //print(json);

      rank1 =
          jsonDecode(json)['response'][0]['league']['standings'][0][0]['rank'];
      form1 =
          jsonDecode(json)['response'][0]['league']['standings'][0][0]['form'];
      points1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['points'];
      gd1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['goalsDiff'];
      thp1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['played'];
      tap1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['played'];
      tgp1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['played'];
      thw1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['win'];
      taw1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['win'];
      tgw1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['win'];
      thd1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['draw'];
      tad1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['draw'];
      tgd1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['draw'];
      thl1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['lose'];
      tal1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['lose'];
      tgl1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['lose'];
      gfh1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['goals']['for'];
      gfa1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['goals']['for'];
      gft1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['goals']['for'];
      gah1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['goals']['against'];
      gaa1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['goals']['against'];
      gat1 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['goals']['against'];
      // print('$form1');
      // //print('From Helper: $json');
    });
  }

  Future getJson2(String? clubID) async {
    HttpClient httpClient = HttpClient();

    String url = Constants.getUriString(clubID);

    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      request.headers.set('x-rapidapi-host', Constants.apiHostBeta);
      request.headers.set('x-rapidapi-key', Constants.apiKey);

      return request.close();
    }).then((HttpClientResponse response) async {
      var json = await response.transform(utf8.decoder).join();

      rank2 =
          jsonDecode(json)['response'][0]['league']['standings'][0][0]['rank'];
      form2 =
          jsonDecode(json)['response'][0]['league']['standings'][0][0]['form'];
      points2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['points'];
      gd2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['goalsDiff'];
      thp2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['played'];
      tap2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['played'];
      tgp2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['played'];
      thw2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['win'];
      taw2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['win'];
      tgw2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['win'];
      thd2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['draw'];
      tad2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['draw'];
      tgd2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['draw'];
      thl2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['lose'];
      tal2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['lose'];
      tgl2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['lose'];
      gfh2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['goals']['for'];
      gfa2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['goals']['for'];
      gft2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['goals']['for'];
      gah2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['home']['goals']['against'];
      gaa2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]
          ['away']['goals']['against'];
      gat2 = jsonDecode(json)['response'][0]['league']['standings'][0][0]['all']
          ['goals']['against'];
      //print('$form2');
      //print('From Helper: $json');
      setState(() {
        isLoading = false; //Data has loaded
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('STATISTICS')),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('${widget.clubOne.toUpperCase()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                          SizedBox(height: 10),
                          Text('RANK = $rank1'),
                          Text('PTS = $points1'),
                          Text('Goal Diff = $gd1'),
                          Text('Form = $form1'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Text('${widget.clubTwo.toUpperCase()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                          SizedBox(height: 10),
                          Text('RANK = $rank2'),
                          Text('PTS = $points2'),
                          Text('Goal Diff = $gd2'),
                          Text('Form = $form2'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text('Games Played',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thp1')),
                        Container(child: Text('Away = $tap1')),
                        Container(child: Text('Total = $tgp1')),
                      ]),
                      Column(children: [
                        Text('Games Played',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thp2')),
                        Container(child: Text('Away = $tap2')),
                        Container(child: Text('Total = $tgp2')),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text('Games Won',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thw1')),
                        Container(child: Text('Away = $taw1')),
                        Container(child: Text('Total = $tgw1')),
                      ]),
                      Column(children: [
                        Text('Games Won',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thw2')),
                        Container(child: Text('Away = $taw2')),
                        Container(child: Text('Total = $tgw2')),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text('Games Drawn',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thd1')),
                        Container(child: Text('Away = $tad1')),
                        Container(child: Text('Total = $tgd1')),
                      ]),
                      Column(children: [
                        Text('Games Drawn',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thd2')),
                        Container(child: Text('Away = $tad2')),
                        Container(child: Text('Total = $tgd2')),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text('Games Lost',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thl1')),
                        Container(child: Text('Away = $tal1')),
                        Container(child: Text('Total = $tgl1')),
                      ]),
                      Column(children: [
                        Text('Games Lost',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $thl2')),
                        Container(child: Text('Away = $tal2')),
                        Container(child: Text('Total = $tgl2')),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text('Goals For',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $gfh1')),
                        Container(child: Text('Away = $gfa1')),
                        Container(child: Text('Total = $gft1')),
                      ]),
                      Column(children: [
                        Text('Goals For',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $gfh2')),
                        Container(child: Text('Away = $gfa2')),
                        Container(child: Text('Total = $gft2')),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Text('Goals Against',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $gah1')),
                        Container(child: Text('Away = $gaa1')),
                        Container(child: Text('Total = $gat1')),
                      ]),
                      Column(children: [
                        Text('Goals Against',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(child: Text('Home = $gah2')),
                        Container(child: Text('Away = $gaa2')),
                        Container(child: Text('Total = $gat2')),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                      color: Colors.black,
                      child: Text(
                        'ANALYSE',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {})
                ],
              ),
            ),
    );
  }
}
