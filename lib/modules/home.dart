import 'package:ecommerce/sample_json/json.dart';
import 'package:ecommerce/shared_style/shared_color.dart';
import 'package:ecommerce/shared_style/shared_style.dart';
import 'package:ecommerce/shared_widget/shared_widgets.dart';
import 'package:ecommerce/shared_widget/silver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height / 6),
              floating: true,
              pinned: true,
            ),
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, 40.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SharedWidgets.text("TRENDING",
                            textStyle: SharedStyle
                                .cardTitleFiraSans12WithLetterSpacing),
                        SharedWidgets.text("Offers of the day",
                            textStyle: SharedStyle.cardHeadingFiraSans20),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: SampleJson.offers.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      SampleJson.offers[index]['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 50.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SharedWidgets.text("MEDICINE FOR YOU",
                            textStyle: SharedStyle
                                .cardTitleFiraSans12WithLetterSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SharedWidgets.text("Explore our product range",
                                textStyle: SharedStyle.cardHeadingFiraSans20),
                            Text(
                              "VIEW ALL",
                              style: GoogleFonts.firaSans(
                                fontSize: 12,
                                letterSpacing: 2,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: SampleJson.offers.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Card(
                                      color: Colors.grey[200],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      elevation: 2,
                                      child: Image.asset(
                                        SampleJson.offers[index]['image'],
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Vicks First Defence nasal spray - 15ml",
                                            maxLines: 3,
                                            style: GoogleFonts.firaSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "Vicks First Defence nasal spray - 15ml",
                                            maxLines: 2,
                                            style: GoogleFonts.firaSans(
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            "Rs. 1200.00",
                                            maxLines: 2,
                                            style: GoogleFonts.firaSans(
                                                fontSize: 14,
                                                color: SharedColors()
                                                    .bodyColorBlue,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 50.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SharedWidgets.text("SEARCH BY",
                            textStyle: SharedStyle
                                .cardTitleFiraSans12WithLetterSpacing),
                        SharedWidgets.text("TOP BRANDS",
                            textStyle: SharedStyle.cardHeadingFiraSans20),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: SampleJson.offers.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      elevation: 2,
                                      child: Image.asset(
                                        SampleJson.offers[index]['image'],
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: Text(
                                        "Dettol",
                                        maxLines: 3,
                                        style: GoogleFonts.firaSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
