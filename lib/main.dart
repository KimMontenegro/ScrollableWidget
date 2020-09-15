import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List places;

  @override 
  void initState(){
    places = [
      'Great Wall of China',
      'The Taj Mahal, India',
      'Petra, Jordan',
      'The Colosseum in Rome, Italy',
      'Christ the Redeemer statue, Rio de Janeiro, Brazil',
      'Chichen Itza, Mexico',
      'Machu Picchu, Peru',
    ];
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scrollable Widget",)
        ),
        body: Stack(
          children: <Widget> [
            Image(
              image: AssetImage("assets/images/7wonders.png"),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            DraggableScrollableSheet(
              builder: (context, scrollController){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: places.length,
                    itemBuilder: (BuildContext context, index){
                      return ListTile(
                        title: Text(places[index]),
                      );
                    }
                  )

                );
              }
            )
          ]
        ),
      )
    );
  }
}