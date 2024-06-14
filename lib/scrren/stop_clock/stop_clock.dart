import 'dart:async';


import 'package:flutter/material.dart';

class StopClock extends StatefulWidget {
  const StopClock({super.key});

  @override
  State<StopClock> createState() => _StopClockState();
}

class _StopClockState extends State<StopClock> {
  DateTime dateTime = DateTime.now();
  int hh = 0;
  int mm = 0;
  int ss = 0;

  bool isOnTimer = false;

  @override
  // void dispose(){
  //   super.dispose();
  //   var timer;
  //   timer?.cancle;
  // }

  void timerClock() async {
    await Future.delayed(Duration(milliseconds: 50), () {
      ss++;

      if (ss > 59) {
        ss = 0;
        mm++;
      }
      if (mm > 59) {
        mm = 0;
        hh++;
      }
      if (hh > 12) {
        hh = 0;
      }
      setState(() {});
    });
    timerClock();
  }

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
          "Stop clock",
          style: TextStyle(
            color: Colors.white,
            fontSize: textScaler.scale(25),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(hh).toString().padLeft(2, '0')} : ${(mm).toString().padLeft(2, '0')} : ${(ss).toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: textScaler.scale(30),
                  color: Colors.white
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (isOnTimer) {
                        timerClock();
                      }
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Start",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      isOnTimer = false;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.stop,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Stop",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  hh = mm = ss = 0;
                  isOnTimer = false;
                  setState(() {});
                },
                icon: Icon(
                  Icons.restart_alt,
                  color: Colors.black,
                ),
                label: Text(
                  "Restart",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


