import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_app/views/utils/QuotesList.dart';
import 'package:provider/provider.dart';

import '../../../provider/ConnectionProvider.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/ImageUtils.dart';

class MoreToolsQuotesPage extends StatefulWidget {
  const MoreToolsQuotesPage({super.key});

  @override
  State<MoreToolsQuotesPage> createState() => _MoreToolsQuotesPageState();
}

class _MoreToolsQuotesPageState extends State<MoreToolsQuotesPage> {
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
                "Quotes",
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
                    CarouselSlider(
                      options: CarouselOptions(
                        scrollDirection: Axis.vertical,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 6),
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        autoPlayCurve: Curves.easeInOut,
                      ),
                      items: [
                        ...QuotesList.map(
                          (e) => Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    e['Navigator'],
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        h * 0.025,
                                      ),
                                      bottomRight: Radius.circular(
                                        h * 0.025,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: LightGreen,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: h * 0.15,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              e['Image'],
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: h * 0.03,
                                        alignment: Alignment.center,
                                        width: w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                              h * 0.025,
                                            ),
                                            bottomRight: Radius.circular(
                                              h * 0.025,
                                            ),
                                          ),
                                          color: LightBGColor,
                                        ),
                                        child: Text(
                                          e['Name'],
                                          style: TextStyle(
                                            fontSize: h * 0.02,
                                            color: WhiteText,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      backgroundColor: LightBGColor,
    );
  }
}
