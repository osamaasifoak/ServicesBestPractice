import 'package:ecommerce/service/connectivity.dart';
import 'package:ecommerce/shared_constant/constant.dart';
import 'package:ecommerce/shared_style/shared_color.dart';
import 'package:ecommerce/shared_widget/tab_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BottomTabPages extends StatefulWidget {
  @override
  _BottomTabPagesState createState() => _BottomTabPagesState();
}

class _BottomTabPagesState extends State<BottomTabPages> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    return SafeArea(
      child: Scaffold(
        body: connectionStatus != ConnectivityStatus.Offline
            ? IndexedStack(
                index: currentIndex,
                children: <Widget>[
                  for (final tabItems in TabNavigationItem.items) tabItems.page
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset(
                      AssetsConstant.noInternet,
                      height: MediaQuery.of(context).size.height / 2,
                      frameBuilder: (context, child, composition) {
                        return AnimatedOpacity(
                          child: child,
                          opacity: composition == null ? 0 : 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("No internet connection..",
                          style: GoogleFonts.firaSans(
                              fontSize: 20, color: Colors.grey)),
                    ),
                    Flexible(
                      child: FlatButton(
                          color: SharedColors().bodyColorBlue,
                          onPressed: () {
                            // Provider.of<ConnectivityServices>(context,
                            //         listen: false)
                            //     .connectionStatusController
                            //     .stream;
                          },
                          child: Text(
                            "Retry",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedIconTheme: IconThemeData(color: SharedColors().bodyColorBlue),
          onTap: (int index) => setState(() => currentIndex = index),
          items: [
            for (final tabItem in TabNavigationItem.items)
              BottomNavigationBarItem(
                icon: tabItem.icon,
                title: tabItem.title,
              )
          ],
        ),
      ),
    );
  }

  Widget showAlert() {
    return AlertDialog(
      backgroundColor: SharedColors().bodyColor,
    );
  }
}
