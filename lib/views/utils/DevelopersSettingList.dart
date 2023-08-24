import 'package:flutter/material.dart';
import 'package:gb_version_app/views/utils/ColorUtils.dart';
import 'package:url_launcher/url_launcher.dart';

List<Map> DevelopersSettingList = [
  {
    'Icon': Icon(
      Icons.add_ic_call_rounded,
      color: DarkGreen,
    ),
    'Title': Text(
      "Visit Our Website",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: WhiteText,
      ),
    ),
    'Subtitle': Text(
      "Check Our Web Website & Contact With Us.",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: LightText,
      ),
    ),
    'OnPressed': () async {
      String websiteURL = 'https://www.hrsolution .com';
      if (await canLaunch(websiteURL)) {
        await launch(websiteURL);
      } else {
        throw 'Could not launch $websiteURL';
      }
    }
  },
  {
    'Icon': Icon(
      Icons.phone_android,
      color: DarkGreen,
    ),
    'Title': Text(
      "Follow Developer",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: WhiteText,
      ),
    ),
    'Subtitle': Text(
      "Check Our Social Medial Platforms & Follow Now.",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: LightText,
      ),
    ),
    'OnPressed': () async {
      String instagramAccount = 'https://www.instagram.com/hr_solution/';
      if (await canLaunch(instagramAccount)) {
        await launch(instagramAccount);
      } else {
        throw 'Could not launch $instagramAccount';
      }
    }
  },
];
