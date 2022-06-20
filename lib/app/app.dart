import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outshade/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      darkTheme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: "Outshade Assignment",
      home: Check(),
    );
  }
}

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  setValues() {}
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late Future<bool> isLogged;
  // @override
  // void initState() {
  //   super.initState();
  //   isLogged = prefs.then((SharedPreferences prefs) {
  //     return prefs.getBool('isLogged') ?? setValues();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
