import 'package:ecommerce/modules/shop.dart';
import 'package:ecommerce/modules/shop_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../modules/home.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final FaIcon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: Home(),
          icon: FaIcon(FontAwesomeIcons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: Shop(),
          icon: FaIcon(FontAwesomeIcons.shoppingBag),
          title: Text("Shop"),
        ),
        TabNavigationItem(
          page: ShopSideBar(),
          icon: FaIcon(FontAwesomeIcons.shoppingBasket),
          title: Text("Shop"),
        ),
      ];
}
