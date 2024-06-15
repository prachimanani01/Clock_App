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
  List timeHistory = [];

  @override
  void timerClock() async {
    isOnTimer = true;
    await Future.delayed(const Duration(milliseconds: 50), () {
      if (isOnTimer) {
        ss++;
      }
      if (ss > 59) {
        ss = 0;
        mm++;
      }
      if (mm > 59) {
        mm = 0;
        hh++;
      }
      if (hh >= 12) {
        hh = 0;
      }
      setState(() {});
    });
    if (isOnTimer) {
      timerClock();
    }
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
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     color: Colors.white,
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   backgroundColor: Colors.black,
      //   title: Text(
      //     "Stop clock",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: textScaler.scale(25),
      //     ),
      //   ),
      // ),
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
                    fontSize: textScaler.scale(30), color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (!isOnTimer) {
                        timerClock();
                      }
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Start",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      isOnTimer = false;
                      timeHistory.add({
                        'hour': hh,
                        'minute': mm,
                        'second': ss,
                      });
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.stop,
                      color: Colors.black,
                    ),
                    label: const Text(
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
                  timeHistory = [];
                  setState(() {});
                },
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.black,
                ),
                label: const Text(
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
