import 'package:clock_app/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDigital = true;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.textScalerOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Clock App",
          style: TextStyle(
            color: Colors.white,
            fontSize: textScaler.scale(25),
          ),
        ),
      ),
      // drawer: const Drawer(
      //   child: Column(
      //     children: [
      //       UserAccountsDrawerHeader(
      //           accountName: Text("Prachi Manani"),
      //           accountEmail: Text("prachimanani16@gmail.com"),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/144036679?v=4"),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.network('https://cdn.dribbble.com/users/4274213/screenshots/8439415/media/af617d85bb9c03d8a971ffb1567c8eec.gif',scale: 1.5,),

            // Image.asset(
            //   "assets/images/img_1.png",
            //   scale: 0.8,
            // ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.digital);
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Center(
                          child: Text(
                        "Digital",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: textScaler.scale(16),
                        ),
                      )
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.analog);
                  },
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Center(
                        child: Text(
                      "Analog",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textScaler.scale(16),
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.starp);
                  },
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: Center(
                        child: Text(
                      "Strap",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textScaler.scale(16),
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.stop);
                    },
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Center(
                          child: Text(
                            "Stop",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textScaler.scale(16),
                            ),
                          )
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
