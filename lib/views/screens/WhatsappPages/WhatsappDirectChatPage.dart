import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../provider/ConnectionProvider.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/ControllerUtils.dart';
import '../../utils/GlobalVariableUtils.dart';
import '../../utils/ImageUtils.dart';

class WhatsappDirectChatPage extends StatefulWidget {
  const WhatsappDirectChatPage({super.key});

  @override
  State<WhatsappDirectChatPage> createState() => _WhatsappDirectChatPageState();
}

class _WhatsappDirectChatPageState extends State<WhatsappDirectChatPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectionProvider>(context, listen: false)
        .checkInternetConnectivity();
    DirectChatPageNumberController = TextEditingController();
    DirectChatPageMessageController = TextEditingController();
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
                "Direct Chat",
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
              padding: EdgeInsets.all(
                h * 0.025,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: h * 0.2,
                          width: w / 2.5,
                          child: Image.asset(
                            DirectChatPageImagePath + DirectChatPageVector,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Enter Mobile Number & Country Code To Send Messages Without Saving Their Number.",
                            style: TextStyle(
                              color: WhiteText,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Form(
                      key: DirectChatPageFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: DirectChatPageNumberController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Valid Phone Number...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              DirectChatPageNumber = val;
                            },
                            cursorColor: WhiteText,
                            style: TextStyle(
                              fontSize: h * 0.02,
                              color: WhiteText,
                              fontWeight: FontWeight.bold,
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
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
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(
                                fontSize: h * 0.02,
                                color: WhiteText,
                              ),
                              filled: true,
                              fillColor: GreyColor,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          TextFormField(
                            controller: DirectChatPageMessageController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Your Messages Here...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              DirectChatPageEnterMessages = val;
                            },
                            cursorColor: WhiteText,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (val) {
                              if (DirectChatPageFormKey.currentState!
                                  .validate()) {
                                DirectChatPageFormKey.currentState!.save();
                              }
                            },
                            style: TextStyle(
                              fontSize: h * 0.02,
                              color: WhiteText,
                              fontWeight: FontWeight.bold,
                            ),
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
                              hintText: "Enter Messages",
                              hintStyle: TextStyle(
                                fontSize: h * 0.02,
                                color: WhiteText,
                              ),
                              filled: true,
                              fillColor: GreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final url = 'https://wa.me/+91$DirectChatPageNumber';
                        if (await canLaunch(url)) {
                          await launch(url);
                          Fluttertoast.showToast(
                            msg: "Sorry! Messages Server Couldn't Load...",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[700],
                            textColor: Colors.white,
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: "Write Your Messages Here Again ...",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[700],
                            textColor: Colors.white,
                          );
                          throw 'Could not launch $url';
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: DarkGreen,
                          borderRadius: BorderRadius.circular(h * 0.01),
                        ),
                        alignment: Alignment.center,
                        height: h * 0.06,
                        width: w,
                        child: Text(
                          'SEND',
                          style: TextStyle(
                            color: WhiteText,
                            fontWeight: FontWeight.normal,
                            fontSize: h * 0.02,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Text(
                      "Suggestion Feed",
                      style: TextStyle(
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.bold,
                        color: GreyColor,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
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
                                WhatsappPageImagePath + WhatsappStatusSaverIcon,
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
              ),
            ),
      backgroundColor: LightBGColor,
    );
  }

  @override
  void dispose() {
    DirectChatPageNumberController.clear();
    DirectChatPageMessageController.clear();
    DirectChatPageNumber = null;
    DirectChatPageEnterMessages = null;
    // TODO: implement dispose
    super.dispose();
  }
}
