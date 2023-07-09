// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:uas_mob/pages/main_page.dart';
import 'package:uas_mob/pages/resepHarian/Jumat.dart';
import 'package:uas_mob/pages/resepHarian/Kamis.dart';
import 'package:uas_mob/pages/resepHarian/Minggu.dart';
import 'package:uas_mob/pages/resepHarian/Rabu.dart';
import 'package:uas_mob/pages/resepHarian/Sabtu.dart';
import 'package:uas_mob/pages/resepHarian/Selasa.dart';
import 'package:uas_mob/pages/resepHarian/Senin.dart';

class DietResepPage extends StatefulWidget {
  const DietResepPage({super.key});

  @override
  State<DietResepPage> createState() => _DietResepPageState();
}

class _DietResepPageState extends State<DietResepPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
        ),
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Image(
              image: AssetImage("assets/images/splashScreen_logo.png"),
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Diet Yuk")
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DefaultTabController(
                  length: 7, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const TabBar(
                          isScrollable: true,
                          labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                          unselectedLabelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Color.fromARGB(255, 189, 96, 169),
                          indicator: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 189, 96, 169),
                                Color.fromARGB(255, 248, 234, 159),
                              ]),
                              color: Colors.black),
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Senin"),
                              ),
                            ),
                            Tab(text: 'Selasa'),
                            Tab(text: 'Rabu'),
                            Tab(text: 'Kamis'),
                            Tab(text: 'Jumat'),
                            Tab(text: 'Sabtu'),
                            Tab(text: 'Minggu'),
                          ],
                        ),
                        Container(
                            height: height * 1, //height of TabBarView
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: const TabBarView(children: <Widget>[
                              Senin(),
                              Selasa(),
                              Rabu(),
                              Kamis(),
                              Jumat(),
                              Sabtu(),
                              Minggu(),
                            ]))
                      ])),
            ]),
      ),
    );
  }
}
