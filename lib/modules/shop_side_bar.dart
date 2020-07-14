import 'package:ecommerce/modules/shop.dart';
import 'package:ecommerce/sample_json/json.dart';
import 'package:ecommerce/service/firebase.dart';
import 'package:ecommerce/shared_style/shared_color.dart';
import 'package:ecommerce/shared_style/shared_style.dart';
import 'package:ecommerce/shared_widget/shared_widgets.dart';
import 'package:ecommerce/shared_widget/silver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopSideBar extends StatefulWidget {
  @override
  _ShopSideBarState createState() => _ShopSideBarState();
}

class _ShopSideBarState extends State<ShopSideBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

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
          color: SharedColors().bodyColorGrey,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0, 40.0),
                child: Column(
                  children: <Widget>[
                    RotatedBox(
                      quarterTurns: 1,
                      child: TabBar(
                          controller: _tabController,
                          indicatorColor: SharedColors().bodyColorBlue,
                          indicatorWeight: 3.0,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          unselectedLabelColor: SharedColors().bodyColorGrey,
                          // padding: EdgeInsets.symmetric(horizontal: 10.0),
                          isScrollable: true,
                          tabs: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.grey, width: 1.0))),
                              child: getSideBarItem(
                                icon: Icon(
                                  Icons.category,
                                  color: Colors.grey,
                                ),
                                text: Text(
                                  "Category",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.grey, width: 1.0))),
                              child: getSideBarItem(
                                icon: Icon(
                                  FontAwesomeIcons.clinicMedical,
                                  color: Colors.grey,
                                ),
                                text: Text(
                                  "Beauty",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.grey, width: 1.0))),
                              child: getSideBarItem(
                                icon: Icon(
                                  FontAwesomeIcons.clinicMedical,
                                  color: Colors.grey,
                                ),
                                text: Text(
                                  "Beauty",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SideBarContent(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getSideBarItem({Icon icon, Text text}) {
    return RotatedBox(
      quarterTurns: -1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[icon, text],
        ),
      ),
    );
  }
}

class SideBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  // width:
                                  //     MediaQuery.of(context).size.width / 2.5,
                                  // height:
                                  //     MediaQuery.of(context).size.height / 5,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Medicine",
                                maxLines: 3,
                                style: GoogleFonts.firaSans(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
