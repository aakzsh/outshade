import 'package:flutter/material.dart';
import 'package:outshade/constants/colors.dart';
import 'package:outshade/data/userdata.dart';
import 'package:outshade/screens/profile.dart';
import 'package:outshade/widgets/listtiles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int fieldAge = 0;
  String fieldGen = 'O';
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors().primary,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "OUTSHADE",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors().accent,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Users",
                    style: TextStyle(
                      fontSize: 25,
                      // color: AppColors().accent,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    // child: Container(
                    child: ListView.builder(
                        itemCount: userData['users']!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
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
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Text(
                                                      "Login as ${userData['users']![index]['name']}",
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(
                                                      height: 40,
                                                    ),
                                                    const Text("Age"),
                                                    TextFormField(
                                                        // inputFormatters: [int],
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: ((value) {
                                                          setState(() {
                                                            fieldAge =
                                                                int.parse(
                                                                    value);
                                                          });
                                                        })),
                                                    const SizedBox(
                                                      height: 50,
                                                    ),
                                                    const Text("Gender (M/F/O"),
                                                    TextFormField(
                                                        onChanged: ((value) {
                                                      setState(() {
                                                        fieldGen = value;
                                                      });
                                                    })),
                                                    const SizedBox(
                                                      height: 30,
                                                    ),
                                                    InkWell(
                                                        onTap: () async {
                                                          SharedPreferences
                                                              preferences =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          preferences.setBool(
                                                              'isLogged', true);
                                                          preferences.setInt(
                                                              'age',
                                                              int.parse(fieldAge
                                                                  .toString()));
                                                          preferences.setString(
                                                              'name',
                                                              userData['users']![
                                                                          index]
                                                                      [
                                                                      'name'] ??
                                                                  '');
                                                          preferences.setString(
                                                              'gender',
                                                              fieldGen
                                                                  .toString());

                                                          preferences.setString(
                                                              'type',
                                                              userData['users']![
                                                                          index]
                                                                      [
                                                                      'atype'] ??
                                                                  '');

                                                          setState(() {
                                                            userAge = int.parse(
                                                                fieldAge
                                                                    .toString());
                                                            userName = userData[
                                                                            'users']![
                                                                        index]
                                                                    ['name'] ??
                                                                '';
                                                            userType = userData[
                                                                            'users']![
                                                                        index]
                                                                    ['atype'] ??
                                                                '';
                                                            userGender =
                                                                fieldGen
                                                                    .toString();
                                                          });
                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          const Profile())),
                                                              (route) => false);
                                                        },
                                                        child: Container(
                                                          height: 35,
                                                          width: 120,
                                                          child: const Center(
                                                              child: Text(
                                                            "Sign In",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                          )),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: AppColors()
                                                                  .accent),
                                                        ))
                                                  ],
                                                )))));
                              },
                              child: userTile(userData['users']![index]['name'],
                                  userData['users']![index]['atype']));
                        }),
                    // )
                  )
                ],
              ))),
    );
  }
}
