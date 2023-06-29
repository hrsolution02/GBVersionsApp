import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_version_app/views/utils/AllQuotesList.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import '../../../../provider/ConnectionProvider.dart';
import '../../../utils/ColorUtils.dart';
import '../../../utils/ImageUtils.dart';

class RelationshipQuotesPage extends StatefulWidget {
  const RelationshipQuotesPage({super.key});

  @override
  State<RelationshipQuotesPage> createState() => _RelationshipQuotesPageState();
}

class _RelationshipQuotesPageState extends State<RelationshipQuotesPage> {
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
                "Relationship Quotes",
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
                    Text(
                      "1. Browse Category And Chose Per Your Need.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.022,
                        color: WhiteText,
                      ),
                    ),
                    Text(
                      "2. Share Or Copy The Quote And use It As You Like. ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h * 0.022,
                        color: WhiteText,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Column(
                      children: RelationshipQuotes.map(
                        (e) => Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  h * 0.02,
                                ),
                                color: GreyColor,
                                border: Border.all(
                                  color: LightGreen,
                                ),
                              ),
                              width: w,
                              padding: EdgeInsets.all(
                                h * 0.01,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      e['Quotes'],
                                      style: TextStyle(
                                        color: WhiteText,
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(
                                        ClipboardData(
                                          text: e['Quotes'],
                                        ),
                                      );
                                      Fluttertoast.showToast(
                                        msg: 'Text Copied To Clipboard',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.grey[700],
                                        textColor: Colors.white,
                                      );
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: LightBGColor,
                                      radius: h * 0.03,
                                      child: Image.asset(
                                        GlobalImagePath + CopyIcon,
                                        height: h * 0.03,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await Share.share(e['Quotes']);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: LightBGColor,
                                      radius: h * 0.03,
                                      child: Image.asset(
                                        GlobalImagePath + ShareIcon,
                                        height: h * 0.03,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                          ],
                        ),
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ),
      backgroundColor: LightBGColor,
    );
  }
}
