import 'dart:async';
import 'dart:io';
import '../models/fixture_stats.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Fixtures table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'epl_fixtures.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Fixtures('
          'id INTEGER PRIMARY KEY,'
          'fixtureID TEXT,'
          'winningTeam TEXT,'
          'homeGoals TEXT,'
          'awayGoals TEXT,'
          'advice TEXT,'
          'homePercentCurrent TEXT,'
          'drawPercentCurrent TEXT,'
          'awayPercentCurrent TEXT,'
          'homeTeam TEXT,'
          'homeLast5Form TEXT,'
          'homeLast5Att TEXT,'
          'homeLast5Def TEXT,'
          'homeLastGoalsFor TEXT,'
          'homeLastGoalsForAvg TEXT,'
          'homeLastGoalsAgainst TEXT,'
          'homeLastGoalsAgainstAvg TEXT,'
          'homeForm TEXT,'
          'homeGPH TEXT,'
          'homeGPA TEXT,'
          'homeWH TEXT,'
          'homeWA TEXT,'
          'homeDH TEXT,'
          'homeDA TEXT,'
          'homeLH TEXT,'
          'homeLA TEXT,'
          'homeGFH TEXT,'
          'homeGFA TEXT,'
          'homeGAH TEXT,'
          'homeGAA TEXT,'
          'homeCleanSheetH TEXT,'
          'homeCleanSheetA TEXT,'
          'homeFailedToScoreH TEXT,'
          'homeFailedToScoreA TEXT,'
          'awayTeam TEXT,'
          'awayLast5Form TEXT,'
          'awayLast5Att TEXT,'
          'awayLast5Def TEXT,'
          'awayLastGoalsFor TEXT,'
          'awayLastGoalsForAvg TEXT,'
          'awayLastGoalsAgainst TEXT,'
          'awayLastGoalsAgainstAvg TEXT,'
          'awayForm TEXT,'
          'awayGPH TEXT,'
          'awayGPA TEXT,'
          'awayWH TEXT,'
          'awayWA TEXT,'
          'awayDH TEXT,'
          'awayDA TEXT,'
          'awayLH TEXT,'
          'awayLA TEXT,'
          'awayGFH TEXT,'
          'awayGFA TEXT,'
          'awayGAH TEXT,'
          'awayGAA TEXT,'
          'awayCleanSheetH TEXT,'
          'awayCleanSheetA TEXT,'
          'awayFailedToScoreH TEXT,'
          'awayFailedToScoreA TEXT,'
          'formComparisonH TEXT,'
          'formComparisonA TEXT,'
          'formAttackH TEXT,'
          'formAttackA TEXT,'
          'formDefenceH TEXT,'
          'formDefenceA TEXT,'
          'formPoissonDistH TEXT,'
          'formPoissonDistA TEXT,'
          'h2hH TEXT,'
          'h2hA TEXT,'
          'goalsH TEXT,'
          'goalsA TEXT,'
          'overallH TEXT,'
          'overallA TEXT,'
          ')');
    });
  }

  // Insert fixture on database
  createFixture(FixtureStats newFixture) async {
    await deleteAllFixtures();
    final db = await (database as FutureOr<Database>);
    final res = await db.insert('Fixtures', newFixture.toJson());

    return res;
  }

  // Delete all fixtures
  Future<int> deleteAllFixtures() async {
    final db = await (database as FutureOr<Database>);
    final res = await db.rawDelete('DELETE FROM Fixtures');

    return res;
  }

  Future<List<FixtureStats>> getAllFixtures() async {
    final db = await (database as FutureOr<Database>);
    final res = await db.rawQuery("SELECT * FROM Fixtures");

    List<FixtureStats> list =
        res.isNotEmpty ? res.map((c) => FixtureStats.fromJson(c)).toList() : [];

    return list;
  }
}
