import 'package:ecommerce/shared_constant/constant.dart';
import 'package:ecommerce/shared_style/shared_color.dart';
import 'package:ecommerce/shared_widget/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;
  MySliverAppBar({@required this.expandedHeight, this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          color: SharedColors().bodyColorBlue,
          height: expandedHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                title == null
                    ? Image(
                        width: MediaQuery.of(context).size.width / 2.5,
                        image: AssetImage(AssetsConstant.logo))
                    : Text(title,
                        style: GoogleFonts.firaSans(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                // SvgPicture.asset(
                //   AssetsConstant.servaidName,
                //   width: MediaQuery.of(context).size.width / 3,
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SharedWidgets.card(FontAwesomeIcons.cartPlus,
                      Colors.white, SharedColors().bodyColorBlue, 0.0),
                )
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                      hintText: "Search for health products and medicines...",
                      hintStyle: GoogleFonts.firaSans(
                        fontSize: 15,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight / 1.5;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
