import 'package:epl_predictor/src/utilities/constants.dart';
import 'dart:convert';
import 'dart:io';
import '../models/fixture_stats.dart';
import '../services/db_provider.dart';

//TODO: https://github.com/fabiojansenbr/flutter_api_to_sqlite/blob/master/lib/src/providers/employee_api_provider.dart

class FixtureApiProvider {
  Future<List<FixtureStats>?> getAllFixtures() async {
    HttpClient httpClient = HttpClient();

    String url = Constants.uriFixturesPredictions('592241');

    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      request.headers.set('x-rapidapi-host', Constants.apiHostBeta);
      request.headers.set('x-rapidapi-key', Constants.apiKey);

      return request.close();
    }).then((HttpClientResponse response) async {
      var json = await response.transform(utf8.decoder).join();
      //print('From Constants: $json');
      print(json);
      return (json) {
        print('Inserting Fixture');
        DBProvider.db.createFixture(FixtureStats.fromJson(json));
      };
    });
  }
}
