import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime dateTime = DateTime.now();
  int hour = 0;
  int minute = 0;
  int second = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Timer.periodic( const Duration (seconds: 1) , (timer) {
      dateTime = DateTime.now();
      hour = dateTime.hour;
      minute = dateTime.minute;
      second = dateTime.second;
      setState(() {});
    });

    return SafeArea(
      child: Scaffold(
       
        backgroundColor: Colors.black,
        body: Center(
          child: Align(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${(dateTime.hour).toString().padLeft(2, '0')} : ${(dateTime.minute).toString().padLeft(2, '0')} : ${(dateTime.second).toString().padLeft(2, '0')}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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



                ...List.generate(
                  60,
                    (index) => Transform.rotate(
                      angle: (index * (pi * 2)) / 60,
                      child: Divider(
                        color: (index % 5 == 0 ) ? Colors.red : Colors.grey,
                        thickness: (index % 5 ==0 ) ? 4: 2,
                        indent: 30,
                        endIndent: (index % 5 == 0 ) ? w * 0.86 : w * 0.9,
                      ),
                    ),
                ),
      
                Transform.rotate(
                  angle: pi/2,
                  child: Transform.rotate(
                    angle: second * (pi * 2) / 60,
                    child: Divider(
                      color: Colors.red,
                      thickness: 2,
                      indent: w * 0.18,
                      endIndent: w * 0.45,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi/2,
                  child: Transform.rotate(
                    angle: minute * (pi * 2) / 60,
                    child: Divider(
                      color: Colors.yellow,
                      thickness: 4,
                      indent: w * 0.25,
                      endIndent: w * 0.45,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi/2,
                  child: Transform.rotate(
                    angle: (hour % 12 + (minute/60)) * (pi * 2) /12,
                    child: Divider(
                      color: Colors.blue,
                      thickness: 4,
                      indent: w * 0.30,
                      endIndent: w * 0.45,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: w * 0.02,
                  backgroundColor: Colors.red,
                ),

      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
