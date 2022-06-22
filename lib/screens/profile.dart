import 'package:flutter/material.dart';
import 'package:outshade/constants/colors.dart';
import 'package:outshade/data/userdata.dart';
import 'package:outshade/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 25,
                        // color: AppColors().accent,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 30,
                        // color: AppColors().accent,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$userAge years old, $userGender",
                      style: const TextStyle(fontSize: 20, color: Colors.white70
                          // color: AppColors().accent,
                          // fontWeight: FontWeight.bold
                          ),
                    ),
                  ]),
            ),
            width: double.maxFinite,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: AppColors().accent.withOpacity(0.5),
                  spreadRadius: 0.4,
                  blurRadius: 0,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              CircleAvatar(
                child: Center(
                  child: Image.asset(
                    'assets/star.png',
                    height: 50,
                  ),
                ),
                // foregroundImage: AssetImage('assets/star.png'),
                radius: 45,
                backgroundColor: Colors.black45,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$userType Account",
                style: const TextStyle(
                  fontSize: 25,
                  // color: AppColors().accent,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          InkWell(
            child: Container(
              height: 45,
              width: 180,
              child: const Center(
                  child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.black, fontSize: 23),
              )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors().accent),
            ),
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear().then((value) => {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false)
                  });
            },
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
