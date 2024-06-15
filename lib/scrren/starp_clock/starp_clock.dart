import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StarpClock extends StatefulWidget {
  const StarpClock({super.key});

  @override
  State<StarpClock> createState() => _StarpClockState();
}

class _StarpClockState extends State<StarpClock> {
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
      // hour = dateTime.hour;
      // minute = dateTime.minute;
      // second = dateTime.second;
      setState(() {});
    });
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,onPressed: (){Navigator.of(context).pop();},),
      //   backgroundColor: Colors.black,
      //   title: Text("Starp Clock",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: textScaler.scale(25),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.black,
      body: Center(
        child: Align(
          child: Stack(
            alignment: Alignment.center,
            children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                "${(dateTime.hour).toString().padLeft(2,'0')}:${(dateTime.minute).toString().padLeft(2,'0')}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: textScaler.scale(45),
                ),
              ),
                Text(
                "\n ${(dateTime.hour < 12) ? 'AM' : 'PM'}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: textScaler.scale(15),
                ),
              ),
            ],)
          ],),
              Transform.scale(
                scale: 9,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  value: dateTime.second / 60,
                  color: Colors.orange,
                ),
              ),
              Transform.scale(
                scale: 8,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  value: dateTime.minute / 60,
                  color: Colors.white,
                ),
              ),
              Transform.scale(
                scale: 7,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  value: (dateTime.hour % 12 + (dateTime.minute / 60)) / 12,
                  color: Colors.green,
                ),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
