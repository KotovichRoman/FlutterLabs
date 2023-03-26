import 'dart:html';

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:lab4/application_concerns.dart';
import 'package:lab4/classes/card_in_pricing.dart';

import 'classes/time_service.dart';

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
        "Visual Design",
        53,
        "Logo, Iconography, Illustration, Animation...",
        "Logo, Iconography, Illustration, Animation and others"),
    CardInPricing(
        "Digital Marketing",
        53,
        "Logo, Iconography, Illustration, Animation...",
        "Logo, Iconography, Illustration, Animation and others")
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var script = ScriptElement()..src = 'time_service.js';
    document.body?.children.add(script);
    final PageController controller = PageController();
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
        body: PageView(
          controller: controller,
          children: [
            SafeArea(
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
                      Row(
                        children: <Widget>[
                          createCardWithInformationAboutApp(card: cards[0]),
                          createCardWithInformationAboutApp(card: cards[1]),
                          createCardWithInformationAboutApp(card: cards[2]),
                        ],
                      )
                    ],
                  )),
            ),
            TimeDisplay(),
          ],
        ));
  }

  Container createCardWithInformationAboutApp({required CardInPricing card}) {
    return Container(
      height: 150,
      width: 260,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 102, 151, 145),
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 102, 151, 145))),
      margin: const EdgeInsets.only(top: 30, bottom: 50, left: 30, right: 30),
      child: Column(
        children: [
          ApplicationConcerns.createTextWithOptions(
              card.title, 30.0, [255, 255, 255, 255], FontWeight.w500),
          ApplicationConcerns.createTextWithOptions(card.expendedDescription,
              18.0, [255, 255, 255, 255], FontWeight.w200),
        ],
      ),
    );
  }

  Expanded _createCard({required CardInPricing card}) {
    return Expanded(
        child: ExpandableNotifier(
      child: ExpandablePanel(
        header: Text(card.title),
        collapsed: SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Text(
              card.collapseDescription,
            ),
          ),
        ),
        expanded: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(card.expendedDescription),
            ElevatedButton(onPressed: () {}, child: const Text("Send mail"))
          ],
        ),
      ),
    ));
  }
}

class TimeDisplay extends StatefulWidget {
  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _getCurrentTime();
  }

  Future<void> _getCurrentTime() async {
    final currentTime = await TimeService.getCurrentTime();
    setState(() {
      _currentTime = currentTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Current time: $_currentTime',
      style: TextStyle(fontSize: 20),
    );
  }
}
