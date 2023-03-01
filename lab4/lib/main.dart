import 'package:flutter/material.dart';

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
    },
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          createTextWithOptions(
              "Thing ", 60.0, [255, 0, 0, 0], FontWeight.w500),
          createTextWithOptions(
              "& design ", 60.0, [255, 102, 151, 145], FontWeight.w500),
          createTextWithOptions(
              "for ruture", 60.0, [255, 0, 0, 0], FontWeight.w500)
        ]),
        Container(
            margin: const EdgeInsets.only(top: 0),
            height: 70,
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                createContainerWithText("UI DESIGN"),
                createContainerWithText("UX RESEARCH"),
                createContainerWithText("BRANDING"),
                createContainerWithText("SOCIAL")
              ],
            )),
        Container(
            margin: const EdgeInsets.only(top: 0),
            height: 700,
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                createCardWithInformationAboutCard(),
                createCardWithInformationAboutCard(),
                createCardWithInformationAboutCard()
              ],
            ))
      ],
    ));
  }
}

Container createContainerWithText(String text) {
  return Container(
      height: 50,
      width: 250,
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Text(text),
        ),
      ));
}

Text createTextWithOptions(
    String text, double fontSize, List<int> color, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        color: Color.fromARGB(color[0], color[1], color[2], color[3]),
        fontWeight: fontWeight,
        fontFamily: "Roboto"),
  );
}

Container createCardWithInformationAboutCard() {
  return Container(
    height: 700,
    width: 400,
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 102, 151, 145),
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
            width: 1, color: const Color.fromARGB(255, 102, 151, 145))),
    margin: const EdgeInsets.only(top: 50, bottom: 50, left: 30, right: 30),
    child: Column(
      children: [
        createTextWithOptions(
            "Hotel Booking App", 35.0, [255, 255, 255, 255], FontWeight.w500),
        createTextWithOptions(
            "Text 2", 22.0, [255, 255, 255, 255], FontWeight.w200)
      ],
    ),
  );
}
