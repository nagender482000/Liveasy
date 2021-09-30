import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileSelection extends StatefulWidget {
  ProfileSelection({Key? key}) : super(key: key);

  @override
  _ProfileSelectionState createState() => _ProfileSelectionState();
  static const routeName = '/profile';
}

class _ProfileSelectionState extends State<ProfileSelection> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
          automaticallyImplyLeading: true,
          leading: Text(" ")),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        margin: EdgeInsets.zero,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Please select your profile",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  letterSpacing: 0.07,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              select(context, "assets/images/shipper.png", "Shipper", 1),
              SizedBox(
                height: 20,
              ),
              select(
                  context, "assets/images/transporter.png", "Transporter", 2),
              SizedBox(
                height: 20,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                minWidth: double.infinity,
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  if (selectedValue == 1) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/shiphome");
                  }
                  if (selectedValue == 2) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("/transhome");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                color: Color(0xFF2E3B62),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Container select(BuildContext context, String img, String name, int val) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Radio<int>(
              value: val,
              groupValue: selectedValue,
              activeColor: Color(0xFF2E3B62),
              toggleable: true,
              onChanged: (value) {
                setState(() => selectedValue = val);
              },
            ),
          ),
          Flexible(
            child: ListTile(
              leading: Image.asset(img),
              title: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  letterSpacing: 0.07,
                ),
              ),
              subtitle: Text(
                "Lorem ipsum dolor sit amet consectetur adipiscing",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.07,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
