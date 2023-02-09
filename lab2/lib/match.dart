// ignore_for_file: avoid_print

import 'package:lab2/sport.dart';
import 'ball.dart';

class Match extends Sport implements Ball {
  @override
  late int size = 15;

  @override
  late int membersCount;

  late String _sportName;

  String get sportName => _sportName;
  set sportName(String value) {
    _sportName = value;
  }

  static int matchesCount = 0;
  late int betsCount = 0;
  late int betsSum = 0;

  Match() {
    matchesCount++;
  }

  Match.withArguments(this.membersCount, {required String sportName})
      : _sportName = sportName {
    matchesCount++;
  }

  @override
  bool haveLargeBall() {
    return size > 20 ? true : false;
  }

  @override
  bool operator >(Sport sport) {
    return membersCount > sport.membersCount ? true : false;
  }

  static bool isMatchClass() {
    return true;
  }

  void placeBet([int bet = 100]) {
    betsSum += bet;
    betsCount++;
    print("bet registered");
  }

  void useCallback(void Function(String value) callback) {
    callback(_sportName);
  }

  void whoPlaceBet(
      {String personName = "Anonim", String personSurname = "Anonim"}) {
    print('Name: $personName');
    print('Surname: $personSurname');
  }
}
