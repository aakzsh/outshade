import 'package:flutter/material.dart';
import 'package:outshade/constants/colors.dart';

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
              padding: EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 25,
                        // color: AppColors().accent,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Krishna",
                      style: TextStyle(
                        fontSize: 30,
                        // color: AppColors().accent,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "19 years old, Male",
                      style: TextStyle(fontSize: 20, color: Colors.white70
                          // color: AppColors().accent,
                          // fontWeight: FontWeight.bold
                          ),
                    ),
                  ]),
            ),
            width: double.maxFinite,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: AppColors().accent.withOpacity(0.5),
                  spreadRadius: 0.4,
                  blurRadius: 0,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.black45,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Permanent Account",
                style: TextStyle(
                  fontSize: 25,
                  // color: AppColors().accent,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Container(
            height: 45,
            width: 180,
            child: Center(
                child: Text(
              "Sign Out",
              style: TextStyle(color: Colors.black, fontSize: 23),
            )),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors().accent),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
