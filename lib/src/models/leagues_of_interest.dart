class LeaguesOfInterest {
  String leagueId, leagueName, season, country;

  LeaguesOfInterest(
      {required this.leagueId,
      required this.leagueName,
      required this.season,
      required this.country});

  @override
  String toString() {
    return '{${this.leagueId},${this.leagueName},${this.season},${this.country}}';
  }
}
