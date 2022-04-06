class FixtureStats {
  var fixtureID;
  var homeTeam, awayTeam, winningTeam, advice;
  var homeGoals,
      awayGoals,
      homePercentCurrent,
      drawPercentCurrent,
      awayPercentCurrent;
  var homeLast5Form,
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

  FixtureStats({
    this.fixtureID,
    this.homeTeam,
    this.awayTeam,
    this.winningTeam,
    this.advice,
    this.homeGoals,
    this.awayGoals,
    this.homePercentCurrent,
    this.drawPercentCurrent,
    this.awayPercentCurrent,
    this.homeLast5Form,
    this.homeLast5Att,
    this.homeLast5Def,
    this.awayLast5Form,
    this.awayLast5Att,
    this.awayLast5Def,
    this.homeLastGoalsFor,
    this.homeLastGoalsAgainst,
    this.awayLastGoalsFor,
    this.awayLastGoalsAgainst,
    this.homeLastGoalsForAvg,
    this.homeLastGoalsAgainstAvg,
    this.awayLastGoalsForAvg,
    this.awayLastGoalsAgainstAvg,
    this.homeForm,
    this.awayForm,
    this.homeGPH,
    this.awayGPH,
    this.homeGPA,
    this.awayGPA,
    this.homeWH,
    this.awayWH,
    this.homeWA,
    this.awayWA,
    this.homeDH,
    this.awayDH,
    this.homeDA,
    this.awayDA,
    this.homeLH,
    this.awayLH,
    this.homeLA,
    this.awayLA,
    this.homeGFH,
    this.awayGFH,
    this.homeGFA,
    this.awayGFA,
    this.homeGAH,
    this.awayGAH,
    this.homeGAA,
    this.awayGAA,
    this.homeCleanSheetH,
    this.awayCleanSheetH,
    this.homeCleanSheetA,
    this.awayCleanSheetA,
    this.homeFailedToScoreH,
    this.awayFailedToScoreH,
    this.homeFailedToScoreA,
    this.awayFailedToScoreA,
    this.formComparisonH,
    this.formComparisonA,
    this.formAttackH,
    this.formAttackA,
    this.formDefenceH,
    this.formDefenceA,
    this.formPoissonDistH,
    this.formPoissonDistA,
    this.h2hH,
    this.h2hA,
    this.goalsH,
    this.goalsA,
    this.overallH,
    this.overallA,
  });

  factory FixtureStats.fromJson(Map<String, dynamic> json) => FixtureStats(
        winningTeam: json['response'][0]['predictions']['winner']['name'],
        homeGoals: json['response'][0]['predictions']['goals']['home'],
        awayGoals: json['response'][0]['predictions']['goals']['away'],
        advice: json['response'][0]['predictions']['advice'],
        homePercentCurrent: json['response'][0]['predictions']['percent']
            ['home'],
        drawPercentCurrent: json['response'][0]['predictions']['percent']
            ['draw'],
        awayPercentCurrent: json['response'][0]['predictions']['percent']
            ['away'],
        //-----------------------------HOME-----------------------
        homeTeam: json['response'][0]['teams']['home']['name'],
        homeLast5Form: json['response'][0]['teams']['home']['last_5']['form'],
        homeLast5Att: json['response'][0]['teams']['home']['last_5']['att'],
        homeLast5Def: json['response'][0]['teams']['home']['last_5']['def'],
        homeLastGoalsFor: json['response'][0]['teams']['home']['last_5']
            ['goals']['for']['total'],
        homeLastGoalsForAvg: json['response'][0]['teams']['home']['last_5']
            ['goals']['for']['average'],
        homeLastGoalsAgainst: json['response'][0]['teams']['home']['last_5']
            ['goals']['against']['total'],
        homeLastGoalsAgainstAvg: json['response'][0]['teams']['home']['last_5']
            ['goals']['against']['average'],
        homeForm: json['response'][0]['teams']['home']['league']['form'],
        homeGPH: json['response'][0]['teams']['home']['league']['fixtures']
            ['played']['home'],
        homeGPA: json['response'][0]['teams']['home']['league']['fixtures']
            ['played']['away'],
        homeWH: json['response'][0]['teams']['home']['league']['fixtures']
            ['wins']['home'],
        homeWA: json['response'][0]['teams']['home']['league']['fixtures']
            ['wins']['away'],
        homeDH: json['response'][0]['teams']['home']['league']['fixtures']
            ['draws']['home'],
        homeDA: json['response'][0]['teams']['home']['league']['fixtures']
            ['draws']['away'],
        homeLH: json['response'][0]['teams']['home']['league']['fixtures']
            ['loses']['home'],
        homeLA: json['response'][0]['teams']['home']['league']['fixtures']
            ['loses']['away'],
        homeGFH: json['response'][0]['teams']['home']['league']['goals']['for']
            ['total']['home'],
        homeGFA: json['response'][0]['teams']['home']['league']['goals']['for']
            ['total']['away'],
        homeGAH: json['response'][0]['teams']['home']['league']['goals']
            ['against']['total']['home'],
        homeGAA: json['response'][0]['teams']['home']['league']['goals']
            ['against']['total']['away'],
        homeCleanSheetH: json['response'][0]['teams']['home']['league']
            ['clean_sheet']['home'],
        homeCleanSheetA: json['response'][0]['teams']['home']['league']
            ['clean_sheet']['away'],
        homeFailedToScoreH: json['response'][0]['teams']['home']['league']
            ['failed_to_score']['home'],
        homeFailedToScoreA: json['response'][0]['teams']['home']['league']
            ['failed_to_score']['away'],
        //------------------------------AWAY-----------------------
        awayTeam: json['response'][0]['teams']['away']['name'],
        awayLast5Form: json['response'][0]['teams']['away']['last_5']['form'],
        awayLast5Att: json['response'][0]['teams']['away']['last_5']['att'],
        awayLast5Def: json['response'][0]['teams']['away']['last_5']['def'],
        awayLastGoalsFor: json['response'][0]['teams']['away']['last_5']
            ['goals']['for']['total'],
        awayLastGoalsForAvg: json['response'][0]['teams']['away']['last_5']
            ['goals']['for']['average'],
        awayLastGoalsAgainst: json['response'][0]['teams']['away']['last_5']
            ['goals']['against']['total'],
        awayLastGoalsAgainstAvg: json['response'][0]['teams']['away']['last_5']
            ['goals']['against']['average'],
        awayForm: json['response'][0]['teams']['away']['league']['form'],
        awayGPH: json['response'][0]['teams']['away']['league']['fixtures']
            ['played']['home'],
        awayGPA: json['response'][0]['teams']['away']['league']['fixtures']
            ['played']['away'],
        awayWH: json['response'][0]['teams']['away']['league']['fixtures']
            ['wins']['home'],
        awayWA: json['response'][0]['teams']['away']['league']['fixtures']
            ['wins']['away'],
        awayDH: json['response'][0]['teams']['away']['league']['fixtures']
            ['draws']['home'],
        awayDA: json['response'][0]['teams']['away']['league']['fixtures']
            ['draws']['away'],
        awayLH: json['response'][0]['teams']['away']['league']['fixtures']
            ['loses']['home'],
        awayLA: json['response'][0]['teams']['away']['league']['fixtures']
            ['loses']['away'],
        awayGFH: json['response'][0]['teams']['away']['league']['goals']['for']
            ['total']['home'],
        awayGFA: json['response'][0]['teams']['away']['league']['goals']['for']
            ['total']['away'],
        awayGAH: json['response'][0]['teams']['away']['league']['goals']
            ['against']['total']['home'],
        awayGAA: json['response'][0]['teams']['away']['league']['goals']
            ['against']['total']['away'],
        awayCleanSheetH: json['response'][0]['teams']['away']['league']
            ['clean_sheet']['home'],
        awayCleanSheetA: json['response'][0]['teams']['away']['league']
            ['clean_sheet']['away'],
        awayFailedToScoreH: json['response'][0]['teams']['away']['league']
            ['failed_to_score']['home'],
        awayFailedToScoreA: json['response'][0]['teams']['away']['league']
            ['failed_to_score']['away'],
        //------------------------COMPARISON---------------
        formComparisonH: json['response'][0]['comparison']['form']['home'],
        formComparisonA: json['response'][0]['comparison']['form']['away'],
        formAttackH: json['response'][0]['comparison']['att']['home'],
        formAttackA: json['response'][0]['comparison']['att']['away'],
        formDefenceH: json['response'][0]['comparison']['def']['home'],
        formDefenceA: json['response'][0]['comparison']['def']['away'],
        formPoissonDistH: json['response'][0]['comparison']
            ['poisson_distribution']['home'],
        formPoissonDistA: json['response'][0]['comparison']
            ['poisson_distribution']['away'],
        h2hH: json['response'][0]['comparison']['h2h']['home'],
        h2hA: json['response'][0]['comparison']['h2h']['away'],
        goalsH: json['response'][0]['comparison']['goals']['home'],
        goalsA: json['response'][0]['comparison']['goals']['away'],
        overallH: json['response'][0]['comparison']['total']['home'],
        overallA: json['response'][0]['comparison']['total']['away'],
      );

  Map<String, dynamic> toJson() => {
        "fixtureID": fixtureID,
        "winningTeam": winningTeam,
        "homeGoals": homeGoals,
        "awayGoals": awayGoals,
        "advice": advice,
        "homePercentCurrent": homePercentCurrent,
        "drawPercentCurrent": drawPercentCurrent,
        "awayPercentCurrent": awayPercentCurrent,
        //-----------------------------HOME-----------------------
        "homeTeam": homeTeam,
        "homeLast5Form": homeLast5Form,
        "homeLast5Att": homeLast5Att,
        "homeLast5Def": homeLast5Def,
        "homeLastGoalsFor": homeLastGoalsFor,
        "homeLastGoalsForAvg": homeLastGoalsForAvg,
        "homeLastGoalsAgainst": homeLastGoalsAgainst,
        "homeLastGoalsAgainstAvg": homeLastGoalsAgainstAvg,
        "homeForm": homeForm,
        "homeGPH": homeGPH,
        "homeGPA": homeGPA,
        "homeWH": homeWH,
        "homeWA": homeWA,
        "homeDH": homeDH,
        "homeDA": homeDA,
        "homeLH": homeLH,
        "homeLA": homeLA,
        "homeGFH": homeGFH,
        "homeGFA": homeGFA,
        "homeGAH": homeGAH,
        "homeGAA": homeGAA,
        "homeCleanSheetH": homeCleanSheetH,
        "homeCleanSheetA": homeCleanSheetA,
        "homeFailedToScoreH": homeFailedToScoreH,
        "homeFailedToScoreA": homeFailedToScoreA,
        //------------------------------AWAY-----------------------
        "awayTeam": awayTeam,
        "awayLast5Form": awayLast5Form,
        "awayLast5Att": awayLast5Att,
        "awayLast5Def": awayLast5Def,
        "awayLastGoalsFor": awayLastGoalsFor,
        "awayLastGoalsForAvg": awayLastGoalsForAvg,
        "awayLastGoalsAgainst": awayLastGoalsAgainst,
        "awayLastGoalsAgainstAvg": awayLastGoalsAgainstAvg,
        "awayForm": awayForm,
        "awayGPH": awayGPH,
        "awayGPA": awayGPA,
        "awayWH": awayWH,
        "awayWA": awayWA,
        "awayDH": awayDH,
        "awayDA": awayDA,
        "awayLH": awayLH,
        "awayLA": awayLA,
        "awayGFH": awayGFH,
        "awayGFA": awayGFA,
        "awayGAH": awayGAH,
        "awayGAA": awayGAA,
        "awayCleanSheetH": awayCleanSheetH,
        "awayCleanSheetA": awayCleanSheetA,
        "awayFailedToScoreH": awayFailedToScoreH,
        "awayFailedToScoreA": awayFailedToScoreA,
        //------------------------COMPARISON---------------
        "formComparisonH": formComparisonH,
        "formComparisonA": formComparisonA,
        "formAttackH": formAttackH,
        "formAttackA": formAttackA,
        "formDefenceH": formDefenceH,
        "formDefenceA": formDefenceA,
        "formPoissonDistH": formPoissonDistH,
        "formPoissonDistA": formPoissonDistA,
        "h2hH": h2hH,
        "h2hA": h2hA,
        "goalsH": goalsH,
        "goalsA": goalsA,
        "overallH": overallH,
        "overallA": overallA,
      };
}
