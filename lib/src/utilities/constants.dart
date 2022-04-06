// void main() {
//   uriFixtures();o
// }

abstract class Constants {
  static String apiHostBeta = 'api-football-beta.p.rapidapi.com';
  static String apiHost = 'api-football-v1.p.rapidapi.com';

  // ---------------------------------------------------------------------------
  //yahoo
  static String apiKey = '6d7f835091mshc2cf3546ddf16afp179c19jsn95d12be2e2f3';
  //gmail
  // static String apiKey = '5b940cdc55msh676b58f0bcdd3f1p17691bjsnc2a2275e4e02';
  // ---------------------------------------------------------------------------

  static String uri = 'https://api-football-v1.p.rapidapi.com/v2/leagueTable/2';

  // GET CURRENT LISTING OF LEAGUES FOR A SPECIFIC SEASON
  static String findLeagueUri =
      'https://api-football-v1.p.rapidapi.com/v3/leagues?season=2021&current=true';
  // static String findLeagueUri =
  //     'https://api-football-beta.p.rapidapi.com/leagues?season=2020';
  //static String findLeagueUri = 'https://api-football-beta.p.rapidapi.com/fixtures?date=2021-03-17';
  static String uriBeta =
      //'https://api-football-beta.p.rapidapi.com/standings?season=2020&league=39';
      'https://api-football-beta.p.rapidapi.com/standings?season=2020&league=525';

  static String getUriString(String? clubID) {
    //return 'https://api-football-beta.p.rapidapi.com/teams/statistics?team=$clubID&season=2020&league=39';
    return 'https://api-football-beta.p.rapidapi.com/standings?season=2020&team=$clubID&league=39';
  }

  static String uriFixtures(
      String dateOfInterest, String league, String season) {
    // DateTime dateToday = DateTime.now();
    // String dateTodayFormatted = dateToday.toString().substring(0, 10);

    // return 'https://api-football-beta.p.rapidapi.com/fixtures?league=$league&season=$season&date=$dateOfInterest';
    return 'https://api-football-v1.p.rapidapi.com/v3/fixtures?date=$dateOfInterest&league=$league&season=$season';
  }

  static String uriFixturesStatistics() {
    return 'https://api-football-beta.p.rapidapi.com/fixtures/statistics?fixture=592241';
  }

  static String uriStandings( String season, String leagueID) {
    return 'https://api-football-v1.p.rapidapi.com/v3/standings?season=$season&league=$leagueID';
  }

  static String uriFixturesPredictions(String fixtureID) {
    return 'https://api-football-beta.p.rapidapi.com/predictions?fixture=$fixtureID';
  }
}
