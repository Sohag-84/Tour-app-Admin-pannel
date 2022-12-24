// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_agency_admin_app/widgets/custom_text_field.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/violet_button.dart';

class AddTourScreen extends StatelessWidget {
  AddTourScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _facilityController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                30.h.heightBox,
                Text(
                  "If you have any problems, please contact us. We are at your service all the time.",
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                customTextField("Owner Name", _nameController),
                customTextField("Description", _descriptionController),
                customTextField("Cost", _costController),
                customTextField("Facilities", _facilityController, maxline: 4),
                customTextField("Destination", _destinationController),
                customTextField("Phone Number", _phoneNumberController),
                Text(
                  "Choose Images",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFE9EBED),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.r),
                    ),
                  ),
                  child: Center(
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                VioletButton(
                  isLoading: false,
                  title: "Next",
                  onAction: () {
                    if (_nameController.text.isEmpty ||
                        _nameController.text.length < 3) {
                      Fluttertoast.showToast(
                          msg: "Name must be at least 3 character");
                    } else if (_descriptionController.text.isEmpty ||
                        _descriptionController.text.length < 3) {
                      Fluttertoast.showToast(
                          msg: "description must be at least 3 character");
                    } else if (_costController.text.isEmpty ||
                        _costController.text.length < 3) {
                      Fluttertoast.showToast(
                          msg: "cost must be at least 3 character");
                    } else if (_facilityController.text.isEmpty ||
                        _facilityController.text.length < 3) {
                      Fluttertoast.showToast(
                          msg: "facility must be at least 3 character");
                    } else if (_destinationController.text.isEmpty ||
                        _destinationController.text.length < 3) {
                      Fluttertoast.showToast(
                          msg: "destination must be at least 3 character");
                    } else if (_phoneNumberController.text.isEmpty ||
                        _phoneNumberController.text.length < 11) {
                      Fluttertoast.showToast(
                          msg: "phone number must be at least 11 character");
                    } else {
                      Fluttertoast.showToast(msg: "Everything is ok");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
