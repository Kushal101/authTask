import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


enum NetworkStatus { Online, Offline }
class NetworkStatusService {
  static bool? isConnected;
  StreamController<NetworkStatus> networkStatusController =
  StreamController<NetworkStatus>();
  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status){
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  NetworkStatus _getNetworkStatus(ConnectivityResult status) {
    if (status == ConnectivityResult.mobile || status == ConnectivityResult.wifi) {
      return NetworkStatus.Online;
    } else{
      return NetworkStatus.Offline;
    }
  }
}

class NetworkAwareWidget extends StatelessWidget {
  final Widget onlineChild;
  final Widget offlineChild;

  const NetworkAwareWidget(
      {Key? key, required this.onlineChild, required this.offlineChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
    if (networkStatus == NetworkStatus.Online) {
      return onlineChild;
    } else {
      return offlineChild;
    }
  }
}
class MyReusableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).hoverColor,
      child: Column(
        children: [
          Center(
            child:

          Text("Please check your internet connection try again",style:Theme.of(context).textTheme.labelMedium),

          ), ],
      ),
    );
  }
}