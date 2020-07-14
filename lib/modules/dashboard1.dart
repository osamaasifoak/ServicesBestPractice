// import 'package:ecommerce/model/cart_model.dart';
// import 'package:ecommerce/sample_json/json.dart';
// import 'package:ecommerce/shared_constant/constant.dart';
// import 'package:ecommerce/shared_style/shared_color.dart';
// import 'package:ecommerce/shared_widget/shared_widgets.dart';
// import 'package:ecommerce/store_provider/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class Dashboard1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           color: SharedColors().bodyColor,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   SharedWidgets.card(FontAwesomeIcons.alignLeft, Colors.black,
//                       Colors.white, 2.0),
//                   Container(),
//                   Stack(
//                     alignment: Alignment.topRight,
//                     children: <Widget>[
//                       SharedWidgets.card(FontAwesomeIcons.shoppingBasket,
//                           Colors.black, Colors.white, 1.0),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Consumer<CartProvider>(
//                           builder: (context, value, child) => Text(
//                             '${value.cart.length}',
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text("Trending",
//                     style: GoogleFonts.abrilFatface(
//                       textStyle: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 1.0,
//                           shadows: [
//                             Shadow(
//                                 color: Colors.black.withOpacity(0.5),
//                                 offset: Offset(10, 5),
//                                 blurRadius: 15.0)
//                           ]),
//                     )),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height / 3,
//                 child: ListView.builder(
//                     physics: BouncingScrollPhysics(),
//                     itemCount: SampleJson.productList.length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         decoration: new BoxDecoration(
//                             boxShadow: index == 0
//                                 ? [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.2),
//                                       blurRadius: 40,
//                                       offset: Offset(-40, -50),
//                                     )
//                                   ]
//                                 : null),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0)),
//                           elevation: 2,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: <Widget>[
//                               Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 4,
//                                   width:
//                                       MediaQuery.of(context).size.width / 2.5,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.network(
//                                       SampleJson.productList[index]['image'],
//                                       fit: BoxFit.cover,
//                                     ),
//                                   )),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Container(
//                                       width: MediaQuery.of(context).size.width /
//                                           3.5,
//                                       child: Text(
//                                           SampleJson.productList[index]['name'],
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold,
//                                             letterSpacing: 0.5,
//                                           ))),
//                                   Container(
//                                       child: Text(
//                                           '${'\$' + SampleJson.productList[index]['price'].toString()}',
//                                           style: GoogleFonts.raleway(
//                                               textStyle: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold,
//                                             letterSpacing: 1.0,
//                                           ))))
//                                 ],
//                               ),
//                               Flexible(
//                                 child: FlatButton(
//                                     color: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(10))),
//                                     onPressed: () {
//                                       Navigator.pushNamed(context,
//                                           RoutesConstant.productDescription);
//                                     },
//                                     child: Text(
//                                       "Add",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     )),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
