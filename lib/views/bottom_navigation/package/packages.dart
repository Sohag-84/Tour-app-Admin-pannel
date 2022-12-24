// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:travel_agency_admin_app/constants/constant.dart';
import 'package:intl/intl.dart' as intl;
import 'package:travel_agency_admin_app/views/bottom_navigation/package/add_tour_screen.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Packages",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Center(
            child: Text(
              intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddTourScreen()),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: firestore.collection("all-data").snapshots(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                  snapshot.data.docs.length,
                  (index) {
                    var data = snapshot.data.docs[index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          data['gallery_img'][0],
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        title: Text(data['destination']),
                        subtitle: Text("${data['cost']} BDT"),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(msg: "edit");
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 10.w),
                                    Text("Edit"),
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              child: InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(msg: "delete");
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.delete),
                                    SizedBox(width: 10.w),
                                    Text("Delete"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
