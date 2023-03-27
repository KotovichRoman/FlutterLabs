import 'package:flutter/material.dart';
import 'package:lab7_8/sqflite_database_page.dart';

void main() {
  DatabaseHelper.createDbAndCRUDForMatches();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: const <Widget>[
        SqfliteDatabasePage(),
      ],
    );
  }
}
