// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'match.dart';

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
  Match match1 = Match(membersCount: 22, sportName: "Football");
  Match match2 = Match(membersCount: 10, sportName: "Basketball");
  Match match3 = Match(membersCount: 14, sportName: "Voleyball");
  match1
    ..takeBall(20)
    ..checkBall();

  print(match1.compareTo(match2));

  List<Match> matches = [match1, match2, match3];
  var match = matches.iterator;
  while (match.moveNext()) {
    print(match.current);
  }

  var json = jsonEncode(match1.toJson());
  print(json);

  var fromJson = Match.fromJson(jsonDecode(json));
  print(fromJson.toString());

  Match.doAsyncPlay();
  Match.doFuturePlay();

  var subscription1 = Match.getStreamData().listen((data) => print(data));
  subscription1.onDone(() => print('Done!'));

  var subscription2 = Match.getSingleStreamData().listen((data) => print(data));
  subscription2.onDone(() => print('Done!'));

  var subscription3 =
      Match.getBroadcastData().listen((data) => print('Subscription 3: $data'));
  var subscription4 =
      Match.getBroadcastData().listen((data) => print('Subscription 4: $data'));
}
