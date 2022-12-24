// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_agency_admin_app/controllers/home_controller.dart';
import 'package:travel_agency_admin_app/views/bottom_navigation/add_tour_screen.dart';
import 'package:travel_agency_admin_app/views/bottom_navigation/home_screen.dart';
import 'package:travel_agency_admin_app/views/bottom_navigation/self_tour_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final navScreen = [
    HomeScreen(),
    AddTourScreen(),
    SelfTourPackage(),
  ];

  final _controllre = Get.put(HomeControllre());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: _controllre.navIndex.value,
            onTap: (index) {
              _controllre.navIndex.value = index;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Tour"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Self package"),
            ],
          );
        },
      ),
      appBar: AppBar(
        actions: [Switch(value: false, onChanged: (value) {})],
      ),
      body: Obx(
        () {
          return Column(
            children: [
              Expanded(child: navScreen.elementAt(_controllre.navIndex.value)),
            ],
          );
        },
      ),
    );
  }
}
