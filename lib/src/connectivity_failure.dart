import 'package:common_classes/common_classes.dart';

sealed class ConnectivityFailure extends Failure {
  ConnectivityFailure(
      {required super.message,
      required super.error,
      required super.stackTrace});
}

final class NoInternetConnectionFailure extends ConnectivityFailure {
  NoInternetConnectionFailure()
      : super(
            message: 'No internet connection',
            error: 'NoInternetConnectionFailure',
            stackTrace: StackTrace.current);
}

final class NoHardwareAccessFailure extends ConnectivityFailure {
  NoHardwareAccessFailure()
      : super(
          message: 'Can not access hardware to check internet connection',
          error: 'NoHardwareAccessFailure',
          stackTrace: StackTrace.current,
        );
}
