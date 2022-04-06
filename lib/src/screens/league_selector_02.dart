//CURRENT 1ST LANDING PAGE

import 'package:epl_predictor/src/screens/league_standings_03_b.dart';
import 'package:flutter/material.dart';
import 'package:epl_predictor/src/utilities/const_leagues_of_interest.dart';
import 'league_fixtures_03.dart';

// REF: https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2
class LeagueSelectorScreen extends StatelessWidget {
  final String country;

  LeagueSelectorScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    // REF:https://stackoverflow.com/questions/49578529/flutter-filter-list-as-per-some-condition
    // this list will supply all the leagues im interested in from the constants file
    final List leaguesOfInterest =
        ListofLeagues.leagues.where((e) => e.country == country).toList();
    // print(leaguesOfInterest);
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 2 of 4'),
      ),
      body: Column(
        children: [
          Text(
            'Select League of Interest...',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height * .75,
            child: Scrollbar(
              isAlwaysShown: true,
              thickness: 20,
              child: ListView.builder(
                itemCount: leaguesOfInterest.length,
                // itemCount: data.length,
                itemBuilder: (context, int index) {
                  // return LeagueItem(data[index]);
                  List<String> leagueData =
                      leaguesOfInterest[index].toString().split(',');

                  //String min = tempLeagueName[1].substring(14, 16).toString();

                  return ListTile(
                    title: Text('${leagueData[1]}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        //print(leagueData[2]);
                        return LeagueFixtures(
                          selectedLeagueID: leagueData[0].substring(1),
                          selectedLeagueName: leagueData[1],
                          season: leagueData[2].substring(0, 4),
                        );
                        // return LeagueStandings(
                        //   selectedLeagueID: leagueData[0].substring(1),
                        //   selectedLeagueName: leagueData[1],
                        //   season: leagueData[2].substring(0, 4),
                        // );
                      }));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class LeagueItem extends StatelessWidget {
//   const LeagueItem(this.league);
//   final League league;

//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(league);
//   }

//   Widget _buildTiles(League root) {
//     if (root.children.isEmpty) return ListTile(title: Text(root.title));
//     return ExpansionTile(
//       key: PageStorageKey<League>(root),
//       title: Text(root.title, style: TextStyle(fontWeight: FontWeight.bold)),
//       // title: Text(root.children[0].leagueName),
//       // children: (root.children.map((e) => _buildTiles)).toList(),
//       children: root.children.map(_buildTiles).toList(),
//     );
//   }
// }
