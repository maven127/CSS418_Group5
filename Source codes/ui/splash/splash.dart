import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futwebapp/app/route.dart';
import 'package:futwebapp/core/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void nextPage() {
    Future.delayed(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, RouteManager.wrapper));
  }

  @override
  void initState() {
    super.initState();
    nextPage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("asset/images/fut.jpeg"))
              ),
              
              width: 210.h,
              height: 240.h,
            ),
            SizedBox(height: 20.h,),
            Text("FUTMINNA COURSE \nREGISTRATION APP", style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
              color: ColorManager.white
            ),),
          ],
        ),
      ),
    );
  }
}