import 'package:flutter/material.dart';
import 'package:lab4/classes/app.dart';
import 'package:lab4/application_concerns.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String _selectedButtonText = "UI DESIGN";

  List<App> cardWithInformationAboutApp = [
    App("Hotel Booking App", "text"),
    App("Financial App", "text"),
    App("3 App", "text")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ApplicationConcerns.createTextWithOptions(
              "Thing ", 60.0, [255, 0, 0, 0], FontWeight.w500),
          ApplicationConcerns.createTextWithOptions(
              "& design ", 60.0, [255, 102, 151, 145], FontWeight.w500),
          ApplicationConcerns.createTextWithOptions(
              "for ruture", 60.0, [255, 0, 0, 0], FontWeight.w500)
        ]),
        Center(
            child: Container(
                margin: const EdgeInsets.only(top: 0),
                height: 70,
                width: double.infinity,
                alignment: Alignment.center,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    createContainerWithTextButton("UI DESIGN"),
                    createContainerWithTextButton("UX RESEARCH"),
                    createContainerWithTextButton("BRANDING"),
                    createContainerWithTextButton("SOCIAL")
                  ],
                ))),
        Container(
            margin: const EdgeInsets.only(top: 0),
            height: 700,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: cardWithInformationAboutApp.length,
                itemBuilder: (BuildContext context, int index) {
                  return createCardWithInformationAboutApp(index);
                })),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          createFooterButton(context, "Our Story"),
          createFooterButton(context, "Our Pricing")
        ])
      ],
    ));
  }

  void cardsInformation(String text) {
    cardWithInformationAboutApp = [];

    List<String> titles1 = ["Hotel Booking App", "Financial App", "3 App"];
    List<String> titles2 = ["1 App", "2 App", "3 App", "4 App"];
    List<String> titles3 = ["1 App", "2 App", "3 App"];
    List<String> titles4 = ["1 App", "2 App", "3 App", "4 App"];

    switch (text) {
      case "UI DESIGN":
        {
          for (String item in titles1) {
            cardWithInformationAboutApp.add(App(item, "text"));
          }
          break;
        }
      case "UX RESEARCH":
        {
          for (String item in titles2) {
            cardWithInformationAboutApp.add(App(item, "text"));
          }
          break;
        }
      case "BRANDING":
        {
          for (String item in titles3) {
            cardWithInformationAboutApp.add(App(item, "text"));
          }
          break;
        }
      case "SOCIAL":
        {
          for (String item in titles4) {
            cardWithInformationAboutApp.add(App(item, "text"));
          }
          break;
        }
    }
  }

  Container createContainerWithTextButton(String text) {
    Color _buttonColor = Color.fromARGB(255, 116, 116, 116);
    if (_selectedButtonText == text) {
      _buttonColor = Color.fromARGB(255, 0, 0, 0);
    }
    return Container(
        height: 50,
        width: 250,
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                cardsInformation(text);
                if (_selectedButtonText == text) {
                  _selectedButtonText = "";
                } else {
                  _selectedButtonText = text;
                }
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: _buttonColor,
            ),
            child: Text(text),
          ),
        ));
  }

  Container createCardWithInformationAboutApp(int index) {
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
          ApplicationConcerns.createTextWithOptions(
              cardWithInformationAboutApp[index].title,
              35.0,
              [255, 255, 255, 255],
              FontWeight.w500),
          ApplicationConcerns.createTextWithOptions(
              cardWithInformationAboutApp[index].description,
              22.0,
              [255, 255, 255, 255],
              FontWeight.w200),
          Image.network(
            "https://www.pngplay.com/wp-content/uploads/7/Apple-IPhone-Mobile-Transparent-Background.png",
            height: 450,
          )
        ],
      ),
    );
  }

  Container createCardInOurPricing(String title, String description) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 102, 151, 145),
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 102, 151, 145))),
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      padding: const EdgeInsets.only(top: 20, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 236, 236),
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 231, 236, 236))),
            child: const Icon(Icons.inbox),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
          ApplicationConcerns.createTextWithOptions(
              title, 25.0, [255, 255, 255, 255], FontWeight.w500),
          ApplicationConcerns.createTextWithOptions(
              description, 15.0, [255, 255, 255, 255], FontWeight.w200)
        ],
      ),
    );
  }

  TextButton createFooterButton(BuildContext context, String textInButton) {
    return TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              switch (textInButton) {
                case "Our Story":
                  {
                    return createContainerInFooterButtonOurStory();
                  }
                case "Our Pricing":
                  {
                    return createContainerInFooterButtonOurPricing();
                  }
                default:
                  {
                    return Container();
                  }
              }
            },
          );
        },
        child: Text(textInButton));
  }

  Container createContainerInFooterButtonOurStory() {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ApplicationConcerns.createTextWithOptions(
              "Our Story", 50.0, [255, 0, 0, 0], FontWeight.w500),
          ApplicationConcerns.createTextWithOptions(
              "It was 2008 when me (Rehan & Adman) started our first start in the february",
              25.0,
              [255, 0, 0, 0],
              FontWeight.w200),
        ],
      ),
    );
  }

  Container createContainerInFooterButtonOurPricing() {
    return Container(
      height: 450,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ApplicationConcerns.createTextWithOptions(
              "Our Pricing", 50.0, [255, 0, 0, 0], FontWeight.w500),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              createCardInOurPricing("Branding", "Text"),
              createCardInOurPricing("Visual Design", "Text"),
              createCardInOurPricing("Digital marketing", "Text")
            ],
          ),
          Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(top: 20, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/our_pricing", (route) => true);
                },
                child: const Text("More information"),
              )),
        ],
      ),
    );
  }
}
