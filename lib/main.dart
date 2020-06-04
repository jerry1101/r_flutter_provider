import 'package:flutter/material.dart';
import './views/search_view.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Movies",
        color: Colors.purpleAccent,
        home: SearchView(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple[800],
          accentColor: Colors.blueGrey,
          buttonColor: Colors.deepPurple[300],
          fontFamily: 'Georgia',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontStyle: FontStyle.normal),
            bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          ),
        ));
  }
}
