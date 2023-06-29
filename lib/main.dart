import 'package:flutter/material.dart';
import 'package:gb_version_app/provider/ConnectionProvider.dart';
import 'package:gb_version_app/views/screens/HomePage.dart';
import 'package:gb_version_app/views/screens/InstagramPage.dart';
import 'package:gb_version_app/views/screens/InstagramPages/InstagramPostDownloadPage.dart';
import 'package:gb_version_app/views/screens/InstagramPages/InstagramProfileDownloadPage.dart';
import 'package:gb_version_app/views/screens/InstagramPages/InstagramStoryDownloadPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/AloneQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/AnimalQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/AttitudeQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/BrokenHeartQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/CrushQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/FamilyQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/FriendshipQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/GoalQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/InspirationQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/LoveQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/MoreToolsQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/MoreToolsTextRepeaterPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/RelationshipQuotesPage.dart';
import 'package:gb_version_app/views/screens/MoreToolsPage/QuotesPage/SadQuotesPage.dart';
import 'package:gb_version_app/views/screens/SettingsPage.dart';
import 'package:gb_version_app/views/screens/SplashScreenPage.dart';
import 'package:gb_version_app/views/screens/WhatsappPage.dart';
import 'package:gb_version_app/views/screens/WhatsappPages/WhatsappDirectChatPage.dart';
import 'package:gb_version_app/views/screens/WhatsappPages/WhatsappStatusSaverPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectionProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'SplashScreenPage',
        theme: ThemeData(useMaterial3: true),
        routes: {
          '/': (context) => const HomePage(),
          'SplashScreenPage': (context) => const SplashScreenPage(),
          'SettingsPage': (context) => const SettingsPage(),
          'InstagramPage': (context) => const InstagramPage(),
          'InstagramStoryDownloadPage': (context) =>
              const InstagramStoryDownloadPage(),
          'InstagramPostDownloadPage': (context) =>
              const InstagramPostDownloadPage(),
          'InstagramProfileDownloadPage': (context) =>
              const InstagramProfileDownloadPage(),
          'WhatsappPage': (context) => const WhatsappPage(),
          'WhatsappDirectChatPage': (context) => const WhatsappDirectChatPage(),
          'WhatsappStatusSaverPage': (context) =>
              const WhatsappStatusSaverPage(),
          'MoreToolsPage': (context) => const MoreToolsPage(),
          'MoreToolsTextRepeaterPage': (context) =>
              const MoreToolsTextRepeaterPage(),
          'MoreToolsQuotesPage': (context) => const MoreToolsQuotesPage(),
          'LoveQuotesPage': (context) => const LoveQuotesPage(),
          'SadQuotesPage': (context) => const SadQuotesPage(),
          'AloneQuotesPage': (context) => const AloneQuotesPage(),
          'AttitudeQuotesPage': (context) => const AttitudeQuotesPage(),
          'InspirationQuotesPage': (context) => const InspirationQuotesPage(),
          'FriendshipQuotesPage': (context) => const FriendshipQuotesPage(),
          'RelationshipQuotesPage': (context) => const RelationshipQuotesPage(),
          'FamilyQuotesPage': (context) => const FamilyQuotesPage(),
          'AnimalQuotesPage': (context) => const AnimalQuotesPage(),
          'BrokenHeartQuotesPage': (context) => const BrokenHeartQuotesPage(),
          'CrushQuotesPage': (context) => const CrushQuotesPage(),
          'GoalQuotesPage': (context) => const GoalQuotesPage(),
        },
      ),
    );
  }
}
