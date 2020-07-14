import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:ecommerce/shared_constant/constant.dart';

class ConnectivityServices {
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();
  ConnectivityServices() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      bool _result = false;
      try {
        Stream.fromFuture(InternetAddress.lookup('google.com')).listen((event) {
          try {
            if (event.isNotEmpty && event[0].rawAddress.isNotEmpty) {
              _result = true;
            }
          } on SocketException catch (_) {
            _result = false;
          }
        }).onDone(() {
          if (_result == true) {
            connectionStatusController.add(ConnectivityStatus.Access);
          } else {
            connectionStatusController.add(ConnectivityStatus.Offline);
          }
        });
      } on SocketException catch (_) {
        _result = false;
      }
    });
  }
}
