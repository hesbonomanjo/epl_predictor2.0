import 'package:flutter/material.dart';

class AnalysisResults extends StatefulWidget {
  final String clubOne, clubTwo;
  final int points1,
      points2,
      tgp1,
      tgp2,
      thw1,
      thd1,
      thp1,
      taw2,
      tad2,
      tap2,
      gfh1,
      gfa2,
      gaa2;

  AnalysisResults(
      {/*required*/ required this.clubOne,
      /*required*/ required this.clubTwo,
      /*required*/ required this.points1,
      /*required*/ required this.points2,
      /*required*/ required this.tgp1,
      /*required*/ required this.tgp2,
      /*required*/ required this.thw1,
      /*required*/ required this.thd1,
      /*required*/ required this.thp1,
      /*required*/ required this.taw2,
      /*required*/ required this.tad2,
      /*required*/ required this.tap2,
      /*required*/ required this.gfh1,
      /*required*/ required this.gfa2,
      /*required*/ required this.gaa2});

  @override
  _AnalysisResultsState createState() => _AnalysisResultsState();
}

class _AnalysisResultsState extends State<AnalysisResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ANALYSIS')),
      ),
      // body: Column(
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Column(
      //                   children: [
      //                     Text('${widget.clubOne.toUpperCase()}',
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.bold, fontSize: 17)),
      //                     SizedBox(height: 10),
      //                     Text('RANK = $rank1'),
      //                     Text('PTS = $points1'),
      //                     Text('Goal Diff = $gd1'),
      //                     Text('Form = $form1'),
      //                   ],
      //                 ),
      //                 SizedBox(height: 10),
      //                 Column(
      //                   children: [
      //                     Text('${widget.clubTwo.toUpperCase()}',
      //                         style: TextStyle(
      //                             fontWeight: FontWeight.bold, fontSize: 17)),
      //                     SizedBox(height: 10),
      //                     Text('RANK = $rank2'),
      //                     Text('PTS = $points2'),
      //                     Text('Goal Diff = $gd2'),
      //                     Text('Form = $form2'),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Column(children: [
      //                   Text('Games Played',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thp1')),
      //                   Container(child: Text('Away = $tap1')),
      //                   Container(child: Text('Total = $tgp1')),
      //                 ]),
      //                 Column(children: [
      //                   Text('Games Played',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thp2')),
      //                   Container(child: Text('Away = $tap2')),
      //                   Container(child: Text('Total = $tgp2')),
      //                 ]),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Column(children: [
      //                   Text('Games Won',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thw1')),
      //                   Container(child: Text('Away = $taw1')),
      //                   Container(child: Text('Total = $tgw1')),
      //                 ]),
      //                 Column(children: [
      //                   Text('Games Won',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thw2')),
      //                   Container(child: Text('Away = $taw2')),
      //                   Container(child: Text('Total = $tgw2')),
      //                 ]),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Column(children: [
      //                   Text('Games Drawn',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thd1')),
      //                   Container(child: Text('Away = $tad1')),
      //                   Container(child: Text('Total = $tgd1')),
      //                 ]),
      //                 Column(children: [
      //                   Text('Games Drawn',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thd2')),
      //                   Container(child: Text('Away = $tad2')),
      //                   Container(child: Text('Total = $tgd2')),
      //                 ]),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Column(children: [
      //                   Text('Games Lost',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thl1')),
      //                   Container(child: Text('Away = $tal1')),
      //                   Container(child: Text('Total = $tgl1')),
      //                 ]),
      //                 Column(children: [
      //                   Text('Games Lost',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $thl2')),
      //                   Container(child: Text('Away = $tal2')),
      //                   Container(child: Text('Total = $tgl2')),
      //                 ]),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Column(children: [
      //                   Text('Goals For',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $gfh1')),
      //                   Container(child: Text('Away = $gfa1')),
      //                   Container(child: Text('Total = $gft1')),
      //                 ]),
      //                 Column(children: [
      //                   Text('Goals For',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $gfh2')),
      //                   Container(child: Text('Away = $gfa2')),
      //                   Container(child: Text('Total = $gft2')),
      //                 ]),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Column(children: [
      //                   Text('Goals Against',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $gah1')),
      //                   Container(child: Text('Away = $gaa1')),
      //                   Container(child: Text('Total = $gat1')),
      //                 ]),
      //                 Column(children: [
      //                   Text('Goals Against',
      //                       style: TextStyle(fontWeight: FontWeight.bold)),
      //                   Container(child: Text('Home = $gah2')),
      //                   Container(child: Text('Away = $gaa2')),
      //                   Container(child: Text('Total = $gat2')),
      //                 ]),
      //               ],
      //             ),
      //             SizedBox(height: 10),
      //             RaisedButton(
      //                 color: Colors.black,
      //                 child: Text(
      //                   'ANALYSE',
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //                 onPressed: () {})
      //           ],
      //         ),,
    );
  }
}
