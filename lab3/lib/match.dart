// ignore_for_file: avoid_print

import 'dart:async';

import 'sport.dart';
import 'ball.dart';

class Match extends Sport
    with Ball
    implements Comparable<Match>, Iterator<Match>, Iterable<Match> {
  late List<Match> matches;
  late int _currentMatch = 0;

  @override
  late int membersCount;

  late String sportName;

  static int matchesCount = 0;
  late int betsCount = 0;
  late int betsSum = 0;

  Match({required this.membersCount, required this.sportName}) {
    matchesCount++;
  }

  void checkBall() {
    print('This match have ball with size $size');
  }

  @override
  int compareTo(Match match) {
    return membersCount.compareTo(match.membersCount);
  }

  @override
  Match get current => matches[_currentMatch];

  @override
  bool moveNext() {
    _currentMatch++;
    return _currentMatch < matches.length;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  Map<String, dynamic> toJson() => {
        'membersCount': membersCount,
        'sportName': sportName,
      };

  static Match fromJson(Map<String, dynamic> json) => Match(
        membersCount: json['membersCount'],
        sportName: json['sportName'],
      );

  @override
  String toString() {
    return "$membersCount : $sportName";
  }

  static void doFuturePlay() {
    print("Начало функции doPlay");
    Future<String> messageFuture = getMessage();
    messageFuture.then((message) {
      print("Получено сообщение: $message");
    });
    print("Завершение функции doPlay");
  }

  static Future<void> doAsyncPlay() async {
    print("Начало функции doPlay");
    String message = await getMessage();
    print("Получено сообщение: $message");
    print("Завершение функции doPlay");
  }

  static Future<String> getMessage() {
    return Future.delayed(const Duration(seconds: 3), () => "Ura, win");
  }

  static Stream<int> getStreamData() async* {
    yield 1;
    await Future.delayed(const Duration(seconds: 1));
    yield 2;
    await Future.delayed(const Duration(seconds: 1));
    yield 3;
  }

  static Stream<int> getSingleStreamData() {
    final controller = StreamController<int>();
    controller.sink.add(1);
    controller.sink.add(2);
    controller.sink.add(3);
    controller.close();
    return controller.stream;
  }

  static Stream<int> getBroadcastData() {
    final controller = StreamController<int>.broadcast();
    controller.sink.add(1);
    controller.sink.add(2);
    controller.sink.add(3);
    return controller.stream;
  }
}
