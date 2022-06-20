import 'package:flutter/material.dart';
import 'package:outshade/constants/colors.dart';

Widget UserTile(name, type) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(19, 19, 19, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.7, color: AppColors().accent),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    type,
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
              Container(
                height: 35,
                width: 120,
                child: Center(
                    child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors().accent),
              )
            ]),
      ));
}
