import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gb_version_app/views/utils/ColorUtils.dart';
import 'package:gb_version_app/views/utils/ImageUtils.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.3,
            ),
            SizedBox(
              height: h * 0.25,
              width: w,
              child: Image.asset(
                SplashScreenImagePath + AppIcon,
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              "GB's Versions",
              style: TextStyle(
                fontSize: h * 0.028,
                fontWeight: FontWeight.bold,
                color: WhiteText,
              ),
            ),Spacer(),
            Text(
              "Powered By",
              style: TextStyle(
                fontSize: h * 0.02,
                fontWeight: FontWeight.w300,
                color: WhiteText,
              ),
            ),
            Text(
              "HR Solutions",
              style: TextStyle(
                fontSize: h * 0.025,
                fontWeight: FontWeight.bold,
                color: WhiteText,
              ),
            ),
            SizedBox(height: h * 0.02,),
          ],
        ),
      ),
      backgroundColor: LightBGColor,
    );
  }
}
