class FixturesToday {
  int? fixtureID;
  String? fixtureDate, home, away;

  FixturesToday(this.fixtureID, this.fixtureDate, this.home, this.away);

  //This factory passes a dynamic json object into a FixturesToday object.
  factory FixturesToday.fromJson(dynamic json) {
    return FixturesToday(
        json['fixtureID'] as int?,
        json['fixtureDate'] as String?,
        json['home'] as String?,
        json['away'] as String?);
  }

  @override
  String toString() {
    return '{${this.fixtureID},${this.fixtureDate},${this.home},${this.away}';
  }
}
