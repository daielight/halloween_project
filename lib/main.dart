import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const HalloweenApp());
}

class HalloweenApp extends StatelessWidget {
  const HalloweenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halloween App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Halloween Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(titleWCounter()), //ADD COUNTER
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(12, (index)
        {
          return Card(
            elevation: 10,
            margin: EdgeInsets.all(8),
            child: imageGetter(),
          );
        }
        ),
      )
    );
  }


  int counter = 0;

  Widget imageGetter(){
    bool isVisible = true;
    if(counter >= 10){
      return gameWon();
    }
    Random numGen = Random();
    num deterVal = numGen.nextInt(10);
    if(deterVal > 5){
      return GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
            counter++;
          });
        },
        child: Visibility(
          visible: isVisible,
          child: Image.asset('jackolantern.jpg'),
        ),
      );
    }
    else{
      return Image.asset('leaves.jpg');
    }
  }

  Widget gameWon(){
    return Image.asset('BOO.jpg');
  }

  String titleWCounter(){
    return 'Halloween App, $counter';
  }
}