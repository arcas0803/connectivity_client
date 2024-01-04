import 'connectivity_localizations.dart';

/// The translations for English (`en`).
class ConnectivityLocalizationsEn extends ConnectivityLocalizations {
  ConnectivityLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get noInternetConnection => 'No internet connection. Please check your internet connection and try again';

  @override
  String get canNotCheckConnectivity => 'Can not check connectivity';
}
