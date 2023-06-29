import 'package:flutter/material.dart';
import 'package:gb_version_app/views/utils/ColorUtils.dart';

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
      "Our Versions.\n0.0.1",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: LightText,
      ),
    ),
  },
];
