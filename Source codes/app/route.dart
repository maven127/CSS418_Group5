
import 'package:flutter/material.dart';
import 'package:futwebapp/ui/courseReg/course_reg.dart';
import 'package:futwebapp/ui/landing/landing.dart';
import 'package:futwebapp/ui/login/login.dart';
import 'package:futwebapp/ui/schoolFees/school_fees.dart';
import 'package:futwebapp/ui/splash/splash.dart';
import 'package:futwebapp/wrapper.dart';

class RouteManager {
  static const String splash = "/";
  static const String landing = "/landing";
  static const String schoolFees = "/schoolFees";
  static const String courseReg = "/courseReg";
  static const String login = "/login";
  static const String wrapper = "/wrapper";
}

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteManager.landing:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case RouteManager.schoolFees:
        return MaterialPageRoute(builder: (_) => const SchoolFeesScreen());
      case RouteManager.courseReg:
        return MaterialPageRoute(builder: (_) => const CourseRegScreen());
      case RouteManager.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteManager.wrapper:
        return MaterialPageRoute(builder: (_) => const Wrapper());
      default:
        return undefined();
    }
  }

  static Route<dynamic> undefined() {
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
