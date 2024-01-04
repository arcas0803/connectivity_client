
#Connetivty Client

## Description

Package to check internet connectivity.

## Getting Started

### Installation

Add the following to your `pubspec.yaml` file:

```yaml

dependencies:
  connectivity_client: ^0.0.1
    git:
      url: https://github.com/arcas0803/connectivity_client.git
      ref: main

```

## Usage

```dart

import 'package:connectivity_client/connectivity_client.dart';

void main() async {
  final connectivity = ConnectivityClient();
  final result = await connectivity.checkConnectivity();
  switch (result) {
    case Success():
      print('Wifi');
      break;
    case Error(exception: final failure):
      switch(failure) {
        case NoInternetConnection():
          print('No internet');
          break;
        case NoHardwareAccess():
          print('Cannot access hardware to check connectivity');
          break;
      }
        break;
  }
}

```

## Failures 

- NoInternetConnection: if device is not connected to internet

- NoHardwareAccess: if device cannot access hardware to check connectivity

Use connectivityFailureUtil to get UI message for failure

```dart

import 'package:connectivity_client/connectivity_client.dart';

void main() async {
  final connectivity = ConnectivityClient();
  final result = await connectivity.checkConnectivity();
  switch (result) {
    case Success():
      print('Wifi');
      break;
    case Error(exception: final failure):
      print(ConnectivityFailureUtil.getFailureNameUI(context: context, failure: failure));
      break;
  }
}

```
