import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/ConnectionProvider.dart';
import '../utils/ColorUtils.dart';
import '../utils/ImageUtils.dart';

class WhatsappPage extends StatefulWidget {
  const WhatsappPage({super.key});

  @override
  State<WhatsappPage> createState() => _WhatsappPageState();
}

class _WhatsappPageState extends State<WhatsappPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectionProvider>(context, listen: false)
        .checkInternetConnectivity();
  }

  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: (Provider.of<ConnectionProvider>(context)
                  .connectivityModel
                  .connectivityStatus ==
              "waiting")
          ? AppBar(
              title: Text(
                "GB's Versions",
                style: TextStyle(color: WhiteText, fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.format_align_justify,
                  color: WhiteText,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
              centerTitle: true,
              backgroundColor: GreyColor,
            )
          : AppBar(
              title: Text(
                "Whatsapp",
                style: TextStyle(
                  color: WhiteText,
                ),
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
              centerTitle: true,
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
          : Padding(
              padding: EdgeInsets.all(h * 0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('WhatsappDirectChatPage');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.02),
                            color: GreyColor,
                            border: Border.all(
                              color: LightGreen,
                            ),
                          ),
                          height: h * 0.2,
                          width: w * 0.42,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: LightBGColor,
                                radius: h * 0.05,
                                child: Image.asset(
                                  WhatsappPageImagePath +
                                      WhatsappDirectChatIcon,
                                  height: h * 0.05,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(
                                "Direct Chat",
                                style: TextStyle(
                                  color: WhiteText,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('WhatsappStatusSaverPage');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.02),
                            color: GreyColor,
                            border: Border.all(
                              color: LightGreen,
                            ),
                          ),
                          height: h * 0.2,
                          width: w * 0.42,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: LightBGColor,
                                radius: h * 0.05,
                                child: Image.asset(
                                  WhatsappPageImagePath +
                                      WhatsappStatusSaverIcon,
                                  height: h * 0.05,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(
                                "Status Saver",
                                style: TextStyle(
                                  color: WhiteText,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      backgroundColor: LightBGColor,
    );
  }
}
