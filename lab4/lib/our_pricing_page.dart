import 'dart:html';

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:lab4/application_concerns.dart';
import 'package:lab4/classes/card_in_pricing.dart';

class OurPricingPage extends StatefulWidget {
  const OurPricingPage({super.key});

  @override
  OurPricingPageState createState() => OurPricingPageState();
}

class OurPricingPageState extends State<OurPricingPage> {
  List<CardInPricing> cards = [
    CardInPricing(
        "Branding",
        53,
        "Logo, Iconography, Illustration, Animation...",
        "Logo, Iconography, Illustration, Animation and others"),
    CardInPricing(
        "Branding",
        53,
        "Logo, Iconography, Illustration, Animation...",
        "Logo, Iconography, Illustration, Animation and others"),
    CardInPricing(
        "Branding",
        53,
        "Logo, Iconography, Illustration, Animation...",
        "Logo, Iconography, Illustration, Animation and others")
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Our Pricing"),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.inbox),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(),
              child: Column(
                children: [
                  _createCard(card: cards[0]),
                  _createCard(card: cards[1]),
                  _createCard(card: cards[2]),
                  ApplicationConcerns.createTextWithOptions(
                      "What our client say?",
                      60.0,
                      [255, 0, 0, 0],
                      FontWeight.w500),
                ],
              )),
        ));
  }

  Expanded _createCard({required CardInPricing card}) {
    return Expanded(
      child: ExpandableNotifier(
        child: ExpandablePanel(
          header: Text(card.title),
          collapsed: const SizedBox(
            height: 40,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing...',
              ),
            ),
          ),
          expanded: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ],
          ),
        ),
      ),
    );
  }
}
