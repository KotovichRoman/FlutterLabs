import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'classes/match.dart';

class SqfliteDatabasePage extends StatefulWidget {
  const SqfliteDatabasePage({super.key});

  @override
  SqfliteDatabasePageState createState() => SqfliteDatabasePageState();
}

class SqfliteDatabasePageState extends State<SqfliteDatabasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [],
    ));
  }
}

class DatabaseHelper {
  static void createDbAndCRUDForMatches() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database =
        openDatabase(join(await getDatabasesPath(), 'match_database.db'),
            onCreate: (db, version) {
      return db.execute(
          'create table matches(id integer primary key, members_count integer, sport_name text)');
    });

    Future<void> insertMatch(Match match) async {
      final db = await database;
      await db.insert(
        'match',
        match.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
