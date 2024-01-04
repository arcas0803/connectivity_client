import 'dart:async';

import 'package:common_classes/common_classes.dart';
import 'package:connectivity_client/src/connectivity_client.dart';
import 'package:connectivity_client/src/connectivity_failure.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

/// Implementation of [ConnectivityClient]
///
/// [logger] is used to log events and errors. If null, no logs will be printed
///
/// [telemetryOnError] is called when an error occurs. If null, no telemetry will be sent
///
/// [telemetryOnSuccess] is called when the operation is successful. If null, no telemetry will be sent
///
class ConnectivityClientImpl implements ConnectivityClient {
  final Logger? _logger;

  final FutureOr<void> Function(Failure)? _telemetryOnError;

  final FutureOr<void> Function()? _telemetryOnSuccess;

  ConnectivityClientImpl({
    Logger? logger,
    FutureOr<void> Function(Failure)? telemetryOnError,
    FutureOr<void> Function()? telemetryOnSuccess,
  })  : _logger = logger,
        _telemetryOnError = telemetryOnError,
        _telemetryOnSuccess = telemetryOnSuccess;

  @override
  FutureOr<Result<void>> checkInternetConnection() {
    return Result.asyncGuard(
      () async {
        _logger?.d(
          '[Start] Checking internet connection',
        );

        final result = await Connectivity().checkConnectivity();

        if (result == ConnectivityResult.none) {
          throw NoInternetConnectionFailure();
        }

        _telemetryOnSuccess?.call();

        _logger?.d(
          '[Success] Device is connected to the internet',
        );
      },
      onError: (e, s) {
        late ConnectivityFailure failure;

        switch (e) {
          case NoInternetConnectionFailure:
            failure = NoInternetConnectionFailure();
            break;
          default:
            failure = NoHardwareAccessFailure();
            break;
        }

        _logger?.e(
          '[Error] Error clearing secure storage',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }
}
