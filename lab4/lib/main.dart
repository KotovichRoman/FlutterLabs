import 'package:flutter/material.dart';
import 'package:lab4/our_pricing_page.dart';
import 'package:lab4/my_home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Lab4-5',
    theme: ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.deepPurple,
    ),
    initialRoute: "/",
    routes: {
      "/": (context) => const MyHomePage(),
      "/our_pricing": (context) => const OurPricingPage()
    },
    debugShowCheckedModeBanner: false,
  ));
}
