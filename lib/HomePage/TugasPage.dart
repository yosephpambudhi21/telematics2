import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widget/CircleButton.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class TugasPage extends StatefulWidget {
  const TugasPage({super.key});

  @override
  State<TugasPage> createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  double _currentSliderValue = 1;
  @override
  Widget build(BuildContext context) {
    Future<String> fetchData(String endpoint) async {
      final dio = Dio();
      try {
        final response = await dio.get('http://10.65.132.253:5000/$endpoint');
        if (response.statusCode == 200) {
          // If the server returns a 200 OK response, parse the data
          return json.decode(response.data);
        } else {
          // If the server did not return a 200 OK response,
          // throw an exception.
          throw Exception('Failed to load data');
        }
      } catch (e) {
        print('Error: $e');
        throw Exception('Failed to make the request');
      }
    }

    Future<String> setBlower(double level) async {
      setState(() {
        _currentSliderValue = level;
      });
      int Intlevel = level.toInt();
      final dio = Dio();
      try {
        final response =
            await dio.get('http://10.65.132.253:5000/blowerLevel/$Intlevel');
        if (response.statusCode == 200) {
          // If the server returns a 200 OK response, parse the data
          return json.decode(response.data);
        } else {
          // If the server did not return a 200 OK response,
          // throw an exception.
          throw Exception('Failed to load data');
        }
      } catch (e) {
        print('Error: $e');
        throw Exception('Failed to make the request');
      }
    }

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Toyota Zenix",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Kadek Agus", style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green),
                          child: const Center(
                              child: Text(
                            "Remote Status : Connected",
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ]),
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset(
                        'images/Vector.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        height: 200,
                        child: Image.asset('images/toyotaZenix.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                  minChildSize: 0.68,
                  maxChildSize: 1,
                  initialChildSize: 0.68,
                  builder: (context, scrollcontroller) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ]),
                      child: SingleChildScrollView(
                        controller: scrollcontroller,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Vehicle Control Zenix",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleButton(
                                          text: "Lock",
                                          iconData: Icons.lock_outline,
                                          onPressed: () async {
                                            try {
                                              String data =
                                                  await fetchData("lockDoor");
                                              print('Data: $data');
                                              // You can perform additional actions with the data here
                                            } catch (e) {
                                              print('Error: $e');
                                            }
                                          },
                                          size: 30),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: CircleButton(
                                            text: "Start Engine",
                                            iconData: Icons.electric_car,
                                            onPressed: () {
                                              print("Start Engine");
                                            },
                                            size: 40),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      CircleButton(
                                          text: "Unlock",
                                          iconData: Icons.lock_open,
                                          onPressed: () async {
                                            try {
                                              String data =
                                                  await fetchData("unlockDoor");
                                              print('Data: $data');
                                              // You can perform additional actions with the data here
                                            } catch (e) {
                                              print('Error: $e');
                                            }
                                          },
                                          size: 30),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 350,
                                    child: const Divider(
                                      height: 15,
                                      thickness: 1,
                                      indent: 5,
                                      endIndent: 5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text("Blower Settings"),
                                  Slider(
                                    value:
                                        _currentSliderValue, // Starting value set directly
                                    min: 1,
                                    max: 31,
                                    label:
                                        _currentSliderValue.round().toString(),
                                    onChanged: (double newValue) {
                                      setBlower(newValue);
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(left: 24),
                                        child: Text('Min',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text('Medium',
                                          style: TextStyle(fontSize: 14)),
                                      Padding(
                                        padding: EdgeInsets.only(right: 24),
                                        child: Text('Max',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Power Window Control",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Text("Left P Window"),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: RawMaterialButton(
                                                        elevation: 2.0,
                                                        fillColor: Colors.white,
                                                        shape:
                                                            const CircleBorder(),
                                                        onPressed: () async {
                                                          try {
                                                            String data =
                                                                await fetchData(
                                                                    "dPowerWindow_UP");
                                                            print(
                                                                'Data: $data');
                                                            // You can perform additional actions with the data here
                                                          } catch (e) {
                                                            print('Error: $e');
                                                          }
                                                        },
                                                        child: const Icon(
                                                          Icons.eject_sharp,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: RawMaterialButton(
                                                        elevation: 2.0,
                                                        fillColor: Colors.white,
                                                        shape:
                                                            const CircleBorder(),
                                                        onPressed: () async {
                                                          try {
                                                            String data =
                                                                await fetchData(
                                                                    "dPowerWindow_DOWN");
                                                            print(
                                                                'Data: $data');
                                                            // You can perform additional actions with the data here
                                                          } catch (e) {
                                                            print('Error: $e');
                                                          }
                                                        },
                                                        child: Transform.rotate(
                                                          angle:
                                                              3.14, // 180 degrees in radians
                                                          child: Icon(
                                                              Icons.eject_sharp,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Text("Rear Left Window"),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: Colors.white,
                                                    shape: const CircleBorder(),
                                                    onPressed: () async {
                                                      try {
                                                        String data =
                                                            await fetchData(
                                                                "rlPowerWindow_UP");
                                                        print('Data: $data');
                                                        // You can perform additional actions with the data here
                                                      } catch (e) {
                                                        print('Error: $e');
                                                      }
                                                    },
                                                    child: const Icon(
                                                      Icons.eject_sharp,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: Colors.white,
                                                    shape: const CircleBorder(),
                                                    onPressed: () async {
                                                      try {
                                                        String data =
                                                            await fetchData(
                                                                "rlPowerWindow_DOWN");
                                                        print('Data: $data');
                                                        // You can perform additional actions with the data here
                                                      } catch (e) {
                                                        print('Error: $e');
                                                      }
                                                    },
                                                    child: Transform.rotate(
                                                      angle:
                                                          3.14, // 180 degrees in radians
                                                      child: Icon(
                                                          Icons.eject_sharp,
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment
                                                .center, // This aligns all children in the center
                                            children: [
                                              Center(
                                                child: Image.asset(
                                                  "images/topCar.png",
                                                  height: 180,
                                                  width: 180,
                                                ),
                                              ),
                                              // Positioned widget is not necessary here since we're using alignment in Stack
                                              Column(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      try {
                                                        String data =
                                                            await fetchData(
                                                                "beamHeadlight");
                                                        print('Data: $data');
                                                        // You can perform additional actions with the data here
                                                      } catch (e) {
                                                        print('Error: $e');
                                                      }
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                      // Set elevation to 0 to remove shadow
                                                      elevation:
                                                          MaterialStateProperty
                                                              .all(0),
                                                      // Add this to remove the splash effect, if you prefer
                                                      overlayColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    child: Icon(
                                                        Icons
                                                            .flashlight_on_sharp,
                                                        color: Colors.blue),
                                                  ),
                                                  SizedBox(
                                                    height: 90,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () async {
                                                        try {
                                                          String data =
                                                              await fetchData(
                                                                  "horn");
                                                          print('Data: $data');
                                                          // You can perform additional actions with the data here
                                                        } catch (e) {
                                                          print('Error: $e');
                                                        }
                                                      },
                                                      child: Icon(
                                                          Icons.surround_sound,
                                                          color: Colors.red)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text("Right D Window"),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: Colors.white,
                                                    shape: const CircleBorder(),
                                                    onPressed: () async {
                                                      try {
                                                        String data =
                                                            await fetchData(
                                                                "pPowerWindow_UP");
                                                        print('Data: $data');
                                                        // You can perform additional actions with the data here
                                                      } catch (e) {
                                                        print('Error: $e');
                                                      }
                                                    },
                                                    child: const Icon(
                                                      Icons.eject_sharp,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: Colors.white,
                                                    shape: const CircleBorder(),
                                                    onPressed: () async {
                                                      try {
                                                        String data =
                                                            await fetchData(
                                                                "pPowerWindow_DOWN");
                                                        print('Data: $data');
                                                        // You can perform additional actions with the data here
                                                      } catch (e) {
                                                        print('Error: $e');
                                                      }
                                                    },
                                                    child: Transform.rotate(
                                                      angle:
                                                          3.14, // 180 degrees in radians
                                                      child: Icon(
                                                          Icons.eject_sharp,
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Text("Rear Right Window"),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: Colors.white,
                                                    shape: const CircleBorder(),
                                                    onPressed: () async {
                                                      try {
                                                        String data =
                                                            await fetchData(
                                                                "rrPowerWindow_UP");
                                                        print('Data: $data');
                                                        // You can perform additional actions with the data here
                                                      } catch (e) {
                                                        print('Error: $e');
                                                      }
                                                    },
                                                    child: const Icon(
                                                      Icons.eject_sharp,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: RawMaterialButton(
                                                    elevation: 2.0,
                                                    fillColor: Colors.white,
                                                    shape: const CircleBorder(),
                                                    onPressed: () async {
                                                      try {
                                                        String data =
                                                            await fetchData(
                                                                "rrPowerWindow_DOWN");
                                                        print('Data: $data');
                                                        // You can perform additional actions with the data here
                                                      } catch (e) {
                                                        print('Error: $e');
                                                      }
                                                    },
                                                    child: Transform.rotate(
                                                      angle:
                                                          3.14, // 180 degrees in radians
                                                      child: Icon(
                                                          Icons.eject_sharp,
                                                          color: Colors.blue),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
