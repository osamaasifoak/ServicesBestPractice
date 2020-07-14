import 'package:ecommerce/sample_json/json.dart';
import 'package:ecommerce/shared_style/shared_style.dart';
import 'package:ecommerce/shared_widget/shared_widgets.dart';
import 'package:ecommerce/shared_widget/silver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height / 6,
                  title: "Shop Now"),
              floating: true,
              pinned: true,
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Transform.translate(
              offset: Offset(0, 40.0),
              child: SharedWidgets.text("EXPLORE BY CATEGORIES",
                  textStyle: SharedStyle.cardTitleFiraSans12WithLetterSpacing),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: SampleJson.offers.length,
                  primary: true,
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Transform.translate(
                          offset: Offset(0, 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                elevation: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    SampleJson.offers[index]['image'],
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: MediaQuery.of(context).size.height /
                                        4.5,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Medicine",
                                  maxLines: 3,
                                  style: GoogleFonts.firaSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
