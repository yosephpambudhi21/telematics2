import 'package:flutter/material.dart';

class HomeControl extends StatefulWidget {
  const HomeControl({super.key});

  @override
  State<HomeControl> createState() => _HomeControlState();
}

class _HomeControlState extends State<HomeControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset('images/toyotaLogo.png', height: 40, width: 40),
                SizedBox(width: 10),
                Text(
                  "Kadek Agus",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "My Garage",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'images/toyotaZenix.png',
                height: 250,
                width: 250,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [Text("100"), Text("Odometer")]),
              Column(children: [Text("---"), Text("Fuel"), Text("FI")]),
              Column(children: [Text("100 Km"), Text("Distance to Empty")]),
            ],
          )
        ],
      ),
    ));
  }
}
