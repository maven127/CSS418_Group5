import 'package:flutter/material.dart';
import 'package:futwebapp/services/auth.dart';
import 'package:futwebapp/ui/landing/landing.dart';
import 'package:futwebapp/ui/login/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel?>(context);
    return (user == null) ? const LoginScreen() : const LandingScreen();
  }
}