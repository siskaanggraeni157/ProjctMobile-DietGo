import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_mob/pages/dietResep.dart';
import 'package:uas_mob/pages/lanjutanPage.dart';
import 'package:uas_mob/pages/menengahPage.dart';
import 'package:uas_mob/pages/pemulaPage.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int _latihan = 0;
  int _menit = 0;

  @override
  void initState() {
    super.initState();
    _loadCounterLatihan();
    _loadCounterMenit();
  }

  // Loading counter value on start
  void _loadCounterLatihan() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _latihan = (prefs.getInt('latihan') ?? 0);
    });
  }

  void _loadCounterMenit() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _menit = (prefs.getInt('menit') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView(children: [
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.pink,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "$_latihan",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "Latihan",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "$_menit",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "Menit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 20, bottom: 20),
          //   width: width * 0.9,
          //   padding: const EdgeInsets.all(20),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.green.shade200,
          //           offset: const Offset(
          //             5.0,
          //             5.0,
          //           ),
          //           blurRadius: 10.0,
          //           spreadRadius: 2.0,
          //         ), //BoxShadow
          //         const BoxShadow(
          //           color: Colors.white,
          //           offset: Offset(0.0, 0.0),
          //           blurRadius: 0.0,
          //           spreadRadius: 0.0,
          //         ),
          //       ]),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Target Mingguan".toUpperCase(),
          //         style: const TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20,
          //         ),
          //       ),
          //       const Text(
          //         "0/6",
          //         style: TextStyle(color: Colors.blue),
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 0, color: Colors.white),
                    elevation: 0),
                onPressed: () {},
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DietResepPage()));
                  },
                  child: Container(
                    width: width * 0.9,
                    height: 100,
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        // color: Colors.limeAccent,
                        image: DecorationImage(
                            image: AssetImage("assets/images/dietBg.jpg"),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'PROGRAM DIET',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PROGRAM OLAHRAGA",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      side: const BorderSide(width: 0, color: Colors.white),
                      elevation: 0),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PemulaPage()));
                  },
                  child: Container(
                    width: width * 0.9,
                    height: 100,
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        // color: Colors.limeAccent,
                        image: DecorationImage(
                            image: AssetImage("assets/images/diet6.jpg"),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'PROGRAM OLAHRAGA PEMULA',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      side: const BorderSide(width: 0, color: Colors.white),
                      elevation: 0),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenengahPage()));
                  },
                  child: Container(
                    width: width * 0.9,
                    height: 100,
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        // color: Colors.limeAccent,
                        image: DecorationImage(
                            image: AssetImage("assets/images/diet7.jpeg"),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'PROGRAM OLAHRAGA MENENGAH',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.white,
                      side: const BorderSide(width: 0, color: Colors.white),
                      elevation: 0),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LanjutanPage()));
                  },
                  child: Container(
                    width: width * 0.9,
                    height: 100,
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        // color: Colors.limeAccent,
                        image: DecorationImage(
                            image: AssetImage("assets/images/diet2.jpg"),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'PROGRAM OLAHRAGA LANJUTAN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
