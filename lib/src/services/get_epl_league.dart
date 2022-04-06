//THIS ALLOWS YOU TO TEST THE RAPIDAPI LIBRARIES BEFORE IMPLEMENTATION ON THE APP.

import 'dart:convert';
import 'dart:io';
import '../utilities/constants.dart';

void main() => getData();

//class GetStats {
// String clubID;
// GetStats(this.clubID);

//Future getData(String clubID) async {
Future getData() async {
  HttpClient httpClient = HttpClient();

  //String url = Constants.uriFixtures('2021-01-28');
  //String url = Constants.uriFixturesPredictions('592347');
  String url = Constants.findLeagueUri;
  // String url = Constants.uriStandings('2021', '585');
  //String url = Constants.uriBeta;
  // String url = Constants.uriFixtures('2022-02-24', '39', '2021');

  httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
    // request.headers.set('x-rapidapi-host', Constants.apiHostBeta);
    request.headers.set('x-rapidapi-host', Constants.apiHost);
    request.headers.set('x-rapidapi-key', Constants.apiKey);

    return request.close();
  }).then((HttpClientResponse response) async {
    var json = await response.transform(utf8.decoder).join();
    print('From Constants: $json');

    //selectedTeam = jsonDecode(json)['response'][0]['league']['standings'][0]
    //   [2]['team']['name'];
    //print('From Helper: $selectedTeam');
    // Process the response.
  });
  //return json;
  // });

//Note to parse the json object from the response to https://jsonformatter.org/json-parser
// Then just use the relative location suggested in the result!!! FINALLY A WORKING PARSER FOR JSON
}
