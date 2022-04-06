class LeagueStandingsData {
  int? rank, played, win, draw, lose, gf, ga, points;
  String? name, form;

  LeagueStandingsData(this.rank, this.name, this.played, this.win, this.draw,
      this.lose, this.gf, this.ga, this.points, this.form);

  //This factory passes a dynamic json object into a FixturesToday object.
  factory LeagueStandingsData.fromJson(dynamic json) {
    return LeagueStandingsData(
        json['rank'] as int?,
        json['name'] as String?,
        json['played'] as int?,
        json['win'] as int?,
        json['draw'] as int?,
        json['lose'] as int?,
        json['gf'] as int?,
        json['ga'] as int?,
        json['points'] as int?,
        json['form'] as String?);
  }

  @override
  String toString() {
    return '{${this.rank},${this.name},${this.played},${this.win},${this.draw},${this.lose},${this.gf}:${this.ga},${this.points},${this.form}';
  }
}
