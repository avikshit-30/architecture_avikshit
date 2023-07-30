import 'dart:async';

import 'package:architecture_avikshit/constants/assets.dart';
import 'package:architecture_avikshit/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.pushReplacement('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container()),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 65,
                  child: Image.asset(
                    PngAssets.appLogo,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'assets/black_logo.png',
                    fit: BoxFit.contain,
                  )),
              Text('Designed & Developed\nby Avikshit Jha',
                  style: w400.size10.colorWhite),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
