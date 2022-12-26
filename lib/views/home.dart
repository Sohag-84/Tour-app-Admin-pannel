// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_agency_admin_app/controllers/home_controller.dart';
import 'package:travel_agency_admin_app/views/bottom_navigation/package/packages.dart';
import 'package:travel_agency_admin_app/views/home/home_screen.dart';
import 'package:travel_agency_admin_app/views/bottom_navigation/self_tour_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final navScreen = [
    HomeScreen(),
    PackagesScreen(),
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
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Package"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Self package"),
            ],
          );
        },
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
