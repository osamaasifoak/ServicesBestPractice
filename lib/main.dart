import 'package:ecommerce/modules/dashboard1.dart';
import 'package:ecommerce/modules/product_description.dart';
import 'package:ecommerce/modules/shop.dart';
import 'package:ecommerce/service/firebase.dart';
import 'package:ecommerce/service/database/db_helper.dart';
import 'package:ecommerce/service/database/db_constant.dart';
import 'package:ecommerce/service/database/db_model/user_model.dart';
import 'package:ecommerce/service/database/db_queries.dart';
import 'package:ecommerce/shared_preference/shared_preference.dart';
import 'package:ecommerce/modules/shop_side_bar.dart';
import 'package:ecommerce/service/connectivity.dart';
import 'package:ecommerce/shared_constant/constant.dart';
import 'package:ecommerce/shared_style/shared_color.dart';
import 'package:ecommerce/store_provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'modules/bottom_tab_pages.dart';
import 'modules/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stetho.initialize();

  UserDbModel _user = new UserDbModel();
  _user.email = 'user@example.com';
  _user.password = '12334';
  _user.name = "osama";
  _user.phone = "112123412";
  _user.loggedIn = 0;

  await DbHelper.initDB(
      DbConstant.getVersion, DbConstant.getDbName, DbQueries.createTables);
  await DbHelper.insert(DbConstant.userTable, _user);
  _user.email = 'user@e.comaa';
  _user.password = '12232asdf';
  _user.name = "osasadasdasd";
  _user.phone = "112232";
  _user.loggedIn = 0;
  await DbHelper.update(DbConstant.userTable, _user, 'id = ? AND name = ?', [_user.id=1, _user.name = 'osa']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        StreamProvider<ConnectivityStatus>.value(
          value: ConnectivityServices().connectionStatusController.stream,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case RoutesConstant.splashScreen:
              return MaterialPageRoute(builder: (_) => SplashScreen());
            case RoutesConstant.bottomTab:
              return MaterialPageRoute(builder: (_) => BottomTabPages());
            case RoutesConstant.home:
              return MaterialPageRoute(builder: (_) => Home());
            case RoutesConstant.shop:
              return MaterialPageRoute(builder: (_) => Shop());
            case RoutesConstant.productDescription:
              return MaterialPageRoute(builder: (_) => ProductDescription());
            case RoutesConstant.shopWithSideBar:
              return MaterialPageRoute(builder: (_) => ShopSideBar());
            default:
              return MaterialPageRoute(
                  builder: (_) => Scaffold(
                        body: Center(
                            child:
                                Text('No route defined for ${settings.name}')),
                      ));
          }
        },
        initialRoute: RoutesConstant.splashScreen,
        // home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseServiceClass().configureFirebase();
    Future<String> fcmToken = SharedPreferenceServiceClass()
        .getStringInSF(SharedPreferencesConstant.fcmKey);
    fcmToken.then((getToken) {
      if (getToken != null) {
        Navigator.pushReplacementNamed(context, RoutesConstant.bottomTab);
      } else {
        FirebaseServiceClass()
            .requestGenerateToken()
            .then((token) => SharedPreferenceServiceClass()
                .addStringInSF(SharedPreferencesConstant.fcmKey, token))
            .then((value) {
          Navigator.pushReplacementNamed(context, RoutesConstant.bottomTab);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: SharedColors().bodyColorBlue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    width: MediaQuery.of(context).size.width / 1.5,
                    image: AssetImage(AssetsConstant.logo))
                // SvgPicture.asset(
                //   AssetsConstant.logo,
                //   width: MediaQuery.of(context).size.width,
                // ),
                // Lottie.asset(
                //   AssetsConstant.splashScreen,
                //   height: MediaQuery.of(context).size.height / 2,
                //   frameBuilder: (context, child, composition) {
                //     return AnimatedOpacity(
                //       child: child,
                //       opacity: composition == null ? 0 : 1,
                //       duration: const Duration(seconds: 1),
                //       curve: Curves.easeOut,
                //     );
                //   },
                // ),
                // Text(
                //   "App title",
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
