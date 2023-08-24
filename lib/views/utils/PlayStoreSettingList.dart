import 'package:flutter/material.dart';
import 'package:gb_version_app/views/utils/ColorUtils.dart';
import 'package:gb_version_app/views/utils/GlobalVariableUtils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

List<Map> PlayStoreSettingList = [
  {
    'Icon': Icon(
      Icons.share,
      color: DarkGreen,
    ),
    'Title': Text(
      "Share App",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: WhiteText,
      ),
    ),
    'Subtitle': Text(
      "Share This App With Your Friends Family & Enjoy With Our Apps.",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: LightText,
      ),
    ),
    'OnPressed': () async {
      String appLink =
          'https://play.google.com/store/apps/details?id=com.example.myapp';

      Share.share(
        'Check out this awesome app:\n$appLink',
        subject: 'Download this cool app!',
      );
    }
  },
  {
    'Icon': Icon(
      Icons.star_rate,
      color: DarkGreen,
    ),
    'Title': Text(
      "Rate Us",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: WhiteText,
      ),
    ),
    'Subtitle': Text(
      "Hope You Enjoyed This App.\nPlease Rate Us And Give Your Feedback.",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: LightText,
      ),
    ),
    'OnPressed': () async {
      String appStoreURL =
          'https://play.google.com/store/apps/details?id=com.example.yourapp'; // Replace with your app's package name
      if (await canLaunch(appStoreURL)) {
        await launch(appStoreURL);
      } else {
        throw 'Could not launch app store URL';
      }
    }
  },
  {
    'Icon': Icon(
      Icons.play_arrow_rounded,
      color: DarkGreen,
    ),
    'Title': Text(
      "Our Other Products",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: WhiteText,
      ),
    ),
    'Subtitle': Text(
      "Hope You Enjoyed With Our Other Products.\nCheck Out Our Other Products",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: LightText,
      ),
    ),
    'OnPressed': () async {
      String appStoreURL =
          'https://play.google.com/store/apps/details?id=com.example.hrsolution';

      if (await canLaunch(appStoreURL)) {
        await launch(appStoreURL);
      } else {
        throw 'Could not launch app store URL';
      }
    }
  },
  {
    'Icon': Icon(
      Icons.comment_bank,
      color: DarkGreen,
    ),
    'Title': Text(
      "App Versions",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: WhiteText,
      ),
    ),
    'Subtitle': Text(
      "App Version: $AppVersion",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: LightText,
      ),
    ),
    'OnPressed': () async {}
  },
];
