import 'package:flutter/material.dart';
import 'package:gb_version_app/views/utils/DevelopersSettingList.dart';
import 'package:gb_version_app/views/utils/GlobalVariableUtils.dart';
import 'package:gb_version_app/views/utils/PlayStoreSettingList.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../provider/ConnectionProvider.dart';
import '../utils/ColorUtils.dart';
import '../utils/ImageUtils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void initState() {
    super.initState();
    Provider.of<ConnectionProvider>(context, listen: false)
        .checkInternetConnectivity();

    // App Version

    GetAppVersion();
  }

  Future<void> GetAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      AppVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(color: WhiteText, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: WhiteText,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: GreyColor,
      ),
      body: (Provider.of<ConnectionProvider>(context)
                  .connectivityModel
                  .connectivityStatus ==
              "waiting")
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.2,
                  ),
                  SizedBox(
                    height: h * 0.25,
                    width: w,
                    child: Image.asset(
                      GlobalImagePath + AlertIcon,
                    ),
                  ),
                  Text(
                    "SOMETHING WENT WRONG",
                    style: TextStyle(
                      fontSize: h * 0.028,
                      fontWeight: FontWeight.bold,
                      color: WhiteText,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Text(
                    "Please Check your Internet Connection...",
                    style: TextStyle(
                      fontSize: h * 0.015,
                      fontWeight: FontWeight.normal,
                      color: WhiteText,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GreyColor,
                      foregroundColor: WhiteText,
                    ),
                    onPressed: () {},
                    child: Text("TRY AGAIN"),
                  ),
                  Spacer(),
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
                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              ),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.all(h * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * 0.2,
                        width: w,
                        child: Image.asset(
                          SettingPageImagePath + SettingVector,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PLAY STORE",
                            style: TextStyle(
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.bold,
                              color: WhiteText,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(h * 0.02),
                              color: GreyColor,
                            ),
                            width: w,
                            child: Column(
                              children: PlayStoreSettingList.map(
                                (e) => ListTile(
                                  onTap: e['OnPressed'],
                                  leading: e['Icon'],
                                  subtitle: e['Subtitle'],
                                  title: e['Title'],
                                ),
                              ).toList(),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Text(
                            "DEVELOPER",
                            style: TextStyle(
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.bold,
                              color: WhiteText,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(h * 0.02),
                              color: GreyColor,
                            ),
                            width: w,
                            child: Column(
                              children: DevelopersSettingList.map(
                                (e) => ListTile(
                                  onTap: e['OnPressed'],
                                  leading: e['Icon'],
                                  subtitle: e['Subtitle'],
                                  title: e['Title'],
                                ),
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
      backgroundColor: LightBGColor,
    );
  }
}
