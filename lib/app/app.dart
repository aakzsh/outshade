import 'package:flutter/material.dart';
import 'package:outshade/screens/home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Outshade Assignment",
      home: Home(),
    );
  }
}
