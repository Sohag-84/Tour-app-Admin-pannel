// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_agency_admin_app/controllers/update_tour_controller.dart';
import 'package:travel_agency_admin_app/widgets/custom_text_field.dart';

import '../../../widgets/violet_button.dart';

class PackageEdit extends StatefulWidget {
  final dynamic data;
  final String docId;
  const PackageEdit({Key? key, required this.data, required this.docId})
      : super(key: key);

  @override
  State<PackageEdit> createState() => _PackageEditState();
}

class _PackageEditState extends State<PackageEdit> {
  UpdateTourController controller = Get.put(UpdateTourController());

  @override
  void initState() {
    super.initState();

    controller.nameController.text = widget.data['owner_name'];
    controller.costController.text = widget.data['cost'].toString();
    controller.descController.text = widget.data['description'];
    controller.destinationController.text = widget.data['destination'];
    controller.facilitiesController.text = widget.data['facilities'];
    controller.phoneController.text = widget.data['phone'];

    log(widget.docId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "${widget.data['destination']}",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextField("Owner name:", controller.nameController),
              customTextField("Cost:", controller.costController),
              customTextField("Description:", controller.descController),
              customTextField("Destination:", controller.destinationController),
              customTextField("Facilities:", controller.facilitiesController),
              customTextField("Phone:", controller.phoneController),
              SizedBox(height: 15.h),
              VioletButton(
                isLoading: false,
                title: "Update",
                onAction: () {
                  controller.updateData(docId: widget.docId);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
