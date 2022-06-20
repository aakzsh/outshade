import 'package:flutter/material.dart';
import 'package:outshade/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outshade/data/userdata.dart';
import 'package:outshade/screens/profile.dart';
import 'package:outshade/widgets/listtiles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors().primary,
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "OUTSHADE",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors().accent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Users",
                    style: TextStyle(
                      fontSize: 25,
                      // color: AppColors().accent,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                        itemCount: userData['users']!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: ((context) => Profile())));

                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        content: Container(
                                            width: w - 40,
                                            height: w - 40,
                                            color: AppColors().primary,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text("Login as Krishna"),
                                                Text("Age"),
                                                Text("Gender"),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  ((context) =>
                                                                      Profile())));
                                                    },
                                                    child: Container(
                                                      height: 35,
                                                      width: 120,
                                                      child: Center(
                                                          child: Text(
                                                        "Sign In",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20),
                                                      )),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          color: AppColors()
                                                              .accent),
                                                    ))
                                              ],
                                            ))));
                              },
                              child: UserTile(userData['users']![index]['name'],
                                  userData['users']![index]['atype']));
                        }),
                  ))
                ],
              ))),
    );
  }
}
