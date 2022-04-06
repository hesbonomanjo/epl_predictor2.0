//CURRENT 1ST LANDING PAGE

import 'package:epl_predictor/src/screens/league_selector_02.dart';
import 'package:epl_predictor/src/utilities/const_countries.dart';
import 'package:flutter/material.dart';

class CountrySelectorScreen extends StatelessWidget {
  CountrySelectorScreen({Key? key}) : super(key: key);
  // this list will supply all the countries im interested in from the constants file
  final List _countriesList = CountriesList.countries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step 1 of 4'),
      ),
      body: Column(
        children: [
          const Text(
            'Select Country...',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height * .75,
            child: Scrollbar(
              thumbVisibility: true,
              // isAlwaysShown: true,
              thickness: 20,
              child: ListView.builder(
                itemCount: _countriesList.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text('${_countriesList[index]}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LeagueSelectorScreen(
                          country: _countriesList[index],
                        );
                      }));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
