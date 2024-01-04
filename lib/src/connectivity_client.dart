import 'dart:async';

import 'package:common_classes/common_classes.dart';

import 'connectivity_failure.dart';

abstract class ConnectivityClient {
  /// Checks if there is internet connection
  ///
  /// Throws [NoInternetConnectionFailure] if there is no internet connection
  ///
  /// Throws [NoHardwareAccessFailure] if there is no hardware access to check internet connection
  ///
  /// Returns [Result] with [void] if there is internet connection
  ///
  FutureOr<Result<void>> checkInternetConnection();
}
