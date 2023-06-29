import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gb_version_app/models/ConnectionModel.dart';

class ConnectionProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  ConnectionModel connectivityModel =
  ConnectionModel(connectivityStatus: "waiting");

  void checkInternetConnectivity() {
    connectivityModel.connectivityStream = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        connectivityModel.connectivityStatus = "WiFi";
        notifyListeners();
      } else if (connectivityResult == ConnectivityResult.mobile) {
        connectivityModel.connectivityStatus = "MobileData";
        notifyListeners();
      } else {
        connectivityModel.connectivityStatus = "waiting";
        notifyListeners();
      }
    });
  }
}