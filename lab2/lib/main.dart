// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lab2/match.dart';

void main() {
  runApp(const MainApp());

  task();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

void task() {
  Match firstMatch = Match.withArguments(22, sportName: 'Football');
  Match secondMatch = Match.withArguments(12, sportName: 'Basketball');
  Match thirdMatch = Match.withArguments(14, sportName: 'Voleyball');

  print(firstMatch.haveLargeBall());
  print(firstMatch > secondMatch);
  print(Match.isMatchClass());
  firstMatch.placeBet();
  secondMatch.placeBet(200);
  firstMatch.useCallback((value) => print(value));
  secondMatch.whoPlaceBet(personSurname: "Me");

  List<Match> matches = [firstMatch, secondMatch];
  matches.add(thirdMatch);
  matches.add(firstMatch);
  print(matches.first);
  print(matches.reversed.first);

  Set<Match> setMatches = {firstMatch, secondMatch};
  print(setMatches.length);
  setMatches.add(firstMatch);
  print(setMatches.length);

  Map<int, Match> mapMatches = {1: firstMatch, 2: secondMatch, 3: thirdMatch};
  mapMatches.forEach((key, value) {
    print(mapMatches[key]);
  });

  try {
    int x = 20;
    int y = x ~/ 0;
    print(y);
  } catch (error) {
    print(error);
  }

  for (Match match in matches) {
    if (match.membersCount == 12) {
      print("This is continue");
      continue;
    } else if (match.membersCount == 14) {
      print("This is break");
      break;
    }
    print(match.toString());
  }
}
