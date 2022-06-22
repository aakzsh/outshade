import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outshade/data/userdata.dart';
import 'package:outshade/screens/home.dart';
import 'package:outshade/screens/profile.dart';
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
      // theme: ThemeData.dark(),
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(

      // ),
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
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late int age = -2;
  @override
  void initState() {
    super.initState();
    // prefs.then((SharedPreferences prefs) {
    //   setState(() {
    //     age = prefs.getInt('age') ?? -1;
    //   });
    //   print("lol $age");
    // });
    SharedPreferences.getInstance().then((value) => {
          age = value.getInt('age') ?? -1,
          print("age is $age"),
          if (age == -1)
            {
              prefs.then((SharedPreferences prefs) {
                prefs.setInt('age', 0);
                prefs.setString('role', 'Temporary');
                prefs.setString('name', 'xyz');
                prefs.setString('gender', 'O');
                prefs.setBool('isLogged', false);
              })
            }
          else
            {
              prefs.then((SharedPreferences prefs) {
                setState(() {
                  userAge = prefs.getInt('age')!;
                  userName = prefs.getString('name')!;
                  userGender = prefs.getString('gender')!;
                  userType = prefs.getString('role')!;
                  userIsLogged = prefs.getBool('isLogged')!;
                });
              })
            }
        });

    print("lmaooo $age");
  }

  @override
  Widget build(BuildContext context) {
    if (userIsLogged) {
      return Profile();
    }
    return Home();
  }
}
