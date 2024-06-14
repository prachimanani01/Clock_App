import 'dart:async';

import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime dateTime = DateTime.now();
  int hour = 0;
  int minute = 0;
  int second = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();
      // hour = dateTime.hour;
      // minute = dateTime.minute;
      // second = dateTime.second;
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Digital clock",
          style: TextStyle(
            color: Colors.white,
            fontSize: textScaler.scale(25),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(dateTime.hour).toString().padLeft(2, '0')} : ${(dateTime.minute).toString().padLeft(2, '0')} : ${(dateTime.second).toString().padLeft(2, '0')}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textScaler.scale(40),
                  ),
                ),
                Text(
                  "\n ${(dateTime.hour < 12) ? 'AM' : 'PM'}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textScaler.scale(15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
