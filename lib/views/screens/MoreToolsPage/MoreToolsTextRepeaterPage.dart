import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_version_app/views/utils/ControllerUtils.dart';
import 'package:gb_version_app/views/utils/GlobalVariableUtils.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../provider/ConnectionProvider.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/ImageUtils.dart';

class MoreToolsTextRepeaterPage extends StatefulWidget {
  const MoreToolsTextRepeaterPage({super.key});

  @override
  State<MoreToolsTextRepeaterPage> createState() =>
      _MoreToolsTextRepeaterPageState();
}

class _MoreToolsTextRepeaterPageState extends State<MoreToolsTextRepeaterPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectionProvider>(context, listen: false)
        .checkInternetConnectivity();
    TextRepeaterPageCountController = TextEditingController();
    TextRepeaterPageMessageController = TextEditingController();
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
                "Text Repeater",
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
                h * 0.02,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: h * 0.15,
                          width: w * 0.4,
                          child: Image.asset(
                            TextRepeaterPageImagePath + TextRepeaterVector,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Write anything Once and Repeat Your Message Many Times Using Features.",
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
                      height: h * 0.01,
                    ),
                    Form(
                      key: TextRepeaterPageFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: TextRepeaterPageMessageController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Your Messages...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              EnterMessages = val;
                            },
                            cursorColor: WhiteText,
                            style: TextStyle(
                              fontSize: h * 0.02,
                              color: WhiteText,
                              fontWeight: FontWeight.bold,
                            ),
                            textInputAction: TextInputAction.next,
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
                          SizedBox(
                            height: h * 0.02,
                          ),
                          TextFormField(
                            controller: TextRepeaterPageCountController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Your Count Digit...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              EnterCount = val;
                            },
                            cursorColor: WhiteText,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (val) {
                              if (TextRepeaterPageFormKey.currentState!
                                  .validate()) {
                                TextRepeaterPageFormKey.currentState!.save();

                                print("===============================");
                                print(EnterMessages);
                                print(EnterCount);
                                print("===============================");
                              }
                            },
                            style: TextStyle(
                              fontSize: h * 0.02,
                              color: WhiteText,
                              fontWeight: FontWeight.bold,
                            ),
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
                              hintText: "Enter Count",
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
                      onTap: () {
                        setState(() {
                          Container();
                          String text = TextRepeaterPageMessageController.text;
                          int repetitions = int.tryParse(
                                  TextRepeaterPageCountController.text) ??
                              0;
                          ResultText =
                              (List.generate(repetitions, (index) => text))
                                  .join('\n');
                        });
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
                          'GENERATE',
                          style: TextStyle(
                            color: WhiteText,
                            fontWeight: FontWeight.normal,
                            fontSize: h * 0.02,
                          ),
                        ),
                      ),
                    ),
                    (ResultText.isEmpty)
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(
                                "PREVIEW",
                                style: TextStyle(
                                  color: WhiteText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: h * 0.02,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                  h * 0.015,
                                ),
                                height: h * 0.2,
                                width: w,
                                decoration: BoxDecoration(
                                  color: GreyColor,
                                  borderRadius: BorderRadius.circular(
                                    h * 0.01,
                                  ),
                                ),
                                child: Text(
                                  ResultText,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: WhiteText,
                                    fontSize: h * 0.02,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      if (ResultText.isNotEmpty) {
                                        await Clipboard.setData(
                                          ClipboardData(
                                            text: ResultText,
                                          ),
                                        );
                                        Fluttertoast.showToast(
                                          msg: 'Text Copied To Clipboard',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey[700],
                                          textColor: Colors.white,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Sorry! Context Is Empty',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey[700],
                                          textColor: Colors.white,
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: DarkGreen,
                                        borderRadius:
                                            BorderRadius.circular(h * 0.01),
                                      ),
                                      alignment: Alignment.center,
                                      height: h * 0.06,
                                      width: w / 2.4,
                                      child: Text(
                                        'COPY',
                                        style: TextStyle(
                                          color: WhiteText,
                                          fontWeight: FontWeight.normal,
                                          fontSize: h * 0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      if (ResultText.isNotEmpty) {
                                        Share.share(ResultText);
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'Sorry! Context Is Empty',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey[700],
                                          textColor: Colors.white,
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: DarkGreen,
                                        borderRadius:
                                            BorderRadius.circular(h * 0.01),
                                      ),
                                      alignment: Alignment.center,
                                      height: h * 0.06,
                                      width: w / 2.4,
                                      child: Text(
                                        'SHARE',
                                        style: TextStyle(
                                          color: WhiteText,
                                          fontWeight: FontWeight.normal,
                                          fontSize: h * 0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    (ResultText.isEmpty)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Text(
                                "Suggestion Feed",
                                style: TextStyle(
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: WhiteText,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('MoreToolsQuotesPage');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(h * 0.02),
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
                                          MoreToolsPageImagePath +
                                              MoreToolsQuotesIcon,
                                          height: h * 0.05,
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      Text(
                                        "Quotes",
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
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
      backgroundColor: LightBGColor,
    );
  }

  @override
  void dispose() {
    TextRepeaterPageMessageController.dispose();
    TextRepeaterPageCountController.dispose();
    super.dispose();
  }
}
