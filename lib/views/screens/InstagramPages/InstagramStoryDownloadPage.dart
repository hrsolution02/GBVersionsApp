import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/ConnectionProvider.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/ControllerUtils.dart';
import '../../utils/GlobalVariableUtils.dart';
import '../../utils/ImageUtils.dart';

class InstagramStoryDownloadPage extends StatefulWidget {
  const InstagramStoryDownloadPage({super.key});

  @override
  State<InstagramStoryDownloadPage> createState() =>
      _InstagramStoryDownloadPageState();
}

class _InstagramStoryDownloadPageState
    extends State<InstagramStoryDownloadPage> {
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
                "Story Download",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Save Stories From Instagram",
                    style: TextStyle(
                      color: LightText,
                      fontWeight: FontWeight.w500,
                      fontSize: h * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Form(
                        key: StoryDownloadPageFormKey,
                        child: Expanded(
                          child: SizedBox(
                            height: h * 0.05,
                            child: TextFormField(
                              controller: StoryDownloadPageUrlController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Valid Phone Number...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                StoryDownloadPageUrl = val;
                              },
                              cursorColor: WhiteText,
                              style: TextStyle(
                                fontSize: h * 0.015,
                                color: WhiteText,
                                fontWeight: FontWeight.bold,
                              ),
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    h * 0.01,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(h * 0.01),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: LightGreen,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    h * 0.01,
                                  ),
                                ),
                                hintText: "Paste URL Here...",
                                hintStyle: TextStyle(
                                  fontSize: h * 0.015,
                                  color: WhiteText,
                                ),
                                filled: true,
                                fillColor: GreyColor,
                              ),
                              onFieldSubmitted: (val) {
                                if (StoryDownloadPageFormKey.currentState!
                                    .validate()) {
                                  StoryDownloadPageFormKey.currentState!.save();

                                  print("===============================");
                                  print(StoryDownloadPageUrl);
                                  print("===============================");
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Something Went Wrong...'),
                              duration: Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'Back',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: h * 0.05,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            color: GreyColor,
                            borderRadius: BorderRadius.circular(h * 0.01),
                          ),
                          child: Icon(
                            Icons.download,
                            color: DarkGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.06,
                  ),
                  Text(
                    "Suggestion Feed",
                    style: TextStyle(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: LightText,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('InstagramPostDownloadPage');
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
                                  InstagramPageImagePath + InstagramReelsIcon,
                                  height: h * 0.05,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(
                                "Post & Reels Download",
                                style: TextStyle(
                                  color: WhiteText,
                                  fontSize: h * 0.015,
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
                              .pushNamed('InstagramProfileDownloadPage');
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
                                  InstagramPageImagePath + InstagramProfileIcon,
                                  height: h * 0.05,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(
                                "Show Profile & Download",
                                style: TextStyle(
                                  color: WhiteText,
                                  fontSize: h * 0.015,
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
