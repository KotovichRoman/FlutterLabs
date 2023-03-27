class Match {
  late int id;
  late int membersCount;
  late String sportName;

  Match();
  Match.withArguments(
      {required this.id, required this.membersCount, required this.sportName});

  Map<String, dynamic> toMap() {
    return {'id': id, 'membres_count': membersCount, 'sport_name': sportName};
  }
}
