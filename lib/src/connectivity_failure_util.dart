import 'package:connectivity_client/localization/connectivity_localizations.dart';
import 'package:connectivity_client/src/connectivity_failure.dart';
import 'package:flutter/widgets.dart';

class ConnectivityFailureUtil {
  static String getFailureNameUI({
    required BuildContext context,
    required ConnectivityFailure failure,
  }) {
    switch (failure) {
      case NoInternetConnectionFailure():
        return ConnectivityLocalizations.of(context)!.noInternetConnection;
      case NoHardwareAccessFailure():
        return ConnectivityLocalizations.of(context)!.canNotCheckConnectivity;
    }
  }
}
