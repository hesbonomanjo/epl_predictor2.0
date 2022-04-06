//CURRENT 4TH LANDING PAGE
import 'package:flutter/material.dart';

class Analytics extends StatefulWidget {
  final formComparisonH,
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
  final String? homeTeam, awayTeam, advice;

  Analytics(
      {/*required*/ required this.homeTeam,
      /*required*/ required this.awayTeam,
      /*required*/ required this.advice,
      /*required*/ required this.formComparisonH,
      /*required*/ required this.formComparisonA,
      /*required*/ required this.formAttackH,
      /*required*/ required this.formAttackA,
      /*required*/ required this.formDefenceH,
      /*required*/ required this.formDefenceA,
      /*required*/ required this.formPoissonDistH,
      /*required*/ required this.formPoissonDistA,
      /*required*/ required this.h2hH,
      /*required*/ required this.h2hA,
      /*required*/ required this.goalsH,
      /*required*/ required this.goalsA,
      /*required*/ required this.overallH,
      /*required*/ required this.overallA});

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  bool homeHasPoisson = false;
  int? poissEval;
  String? analyticsAdvice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whoHasPoisson();
    evaluatePoisson();
    getAdvice();
  }

  bool whoHasPoisson() {
    if (widget.formPoissonDistH.toString().length == 2) {
      homeHasPoisson = false;
    } else if (widget.formPoissonDistH.toString().length == 3) {
      if (int.parse(widget.formPoissonDistH.substring(0, 2)) >
          int.parse(widget.formPoissonDistA.substring(0, 2))) {
        homeHasPoisson = true;
      } else if (int.parse(widget.formPoissonDistH.substring(0, 2)) <
          int.parse(widget.formPoissonDistA.substring(0, 2))) {
        homeHasPoisson = false;
      }
    } else if (widget.formPoissonDistH.toString().length == 4) {
      homeHasPoisson = true;
    }

    return homeHasPoisson;
  }

  int? evaluatePoisson() {
    if (widget.formPoissonDistH.toString().length == 2) {
      poissEval =
          (int.parse(widget.formPoissonDistH.substring(0, 1)) - 50).abs();
    } else if (widget.formPoissonDistH.toString().length == 3) {
      poissEval =
          (int.parse(widget.formPoissonDistH.substring(0, 2)) - 50).abs();
    } else if (widget.formPoissonDistH.toString().length == 4) {
      poissEval =
          (int.parse(widget.formPoissonDistH.substring(0, 3)) - 50).abs();
    }
    return poissEval;
  }

  String? getAdvice() {
    if (poissEval! < 5) {
      analyticsAdvice = 'Possible Flip';
    } else if (poissEval! < 10) {
      analyticsAdvice = 'High Drawing Chance';
    } else
      analyticsAdvice = homeHasPoisson
          ? '${widget.homeTeam} to Win'
          : '${widget.awayTeam} to Win';

    return analyticsAdvice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Analytics Results')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Center(
            child: Text('${widget.homeTeam} vs ${widget.awayTeam}',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 5),
          Divider(height: 2, thickness: 3),
          SizedBox(height: 5),
          Text('Advice : ${widget.advice}',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Divider(height: 2, thickness: 3),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              children: [
                Text('HOME FORM = ${widget.formComparisonH}'),
                Text('ATTACK = ${widget.formAttackH}'),
                Text('DEFENCE = ${widget.formDefenceH}'),
                Text('POISSON = ${widget.formPoissonDistH}'),
                Text('H2H = ${widget.h2hH}'),
                Text('GOALS HOME = ${widget.goalsH}'),
                SizedBox(height: 3),
                Text('OVERALL HOME = ${widget.overallH}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Column(children: [
              Text('AWAY FORM = ${widget.formComparisonA}'),
              Text('ATTACK = ${widget.formAttackA}'),
              Text('DEFENCE = ${widget.formDefenceA}'),
              Text('POISSON = ${widget.formPoissonDistA}'),
              Text('H2H = ${widget.h2hA}'),
              Text('GOALS AWAY = ${widget.goalsA}'),
              SizedBox(height: 3),
              Text('OVERALL AWAY = ${widget.overallA}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ]),
          SizedBox(height: 10),
          Divider(height: 2, thickness: 3),
          SizedBox(height: 30),
          homeHasPoisson
              ? Center(
                  child: Text('Poisson Value: ${poissEval.toString()} HOME',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                )
              : Center(
                  child: Text('Poisson Value: ${poissEval.toString()} AWAY',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
          SizedBox(height: 30),
          Divider(height: 2, thickness: 3),
          Container(
            height: 100,
            color: Colors.greenAccent,
            child: Center(
              child: Text(
                '$analyticsAdvice',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 2, thickness: 3),
        ],
      ),
    );
  }
}
