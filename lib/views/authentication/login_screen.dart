import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:travel_agency_admin_app/views/home.dart';

import '../../constants/app_colors.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/violet_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login\nTo Your Account",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.violetColor,
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              TextFormField(
                controller: controller.passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Obx(() {
                return VioletButton(
                  isLoading: controller.isLoading.value,
                  title: "Log in",
                  onAction: () async {
                    controller.isLoading(true);
                    await controller.loginMethod().then((value) {
                      if (value != null) {
                        Fluttertoast.showToast(msg: "Logged in");
                        Get.offAll(() => Home());
                        controller.isLoading(false);
                      } else {
                        controller.isLoading(false);
                      }
                    });
                  },
                );
              }),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
