import 'connectivity_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class ConnectivityLocalizationsEs extends ConnectivityLocalizations {
  ConnectivityLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get noInternetConnection => 'No hay conexión a Internet. Por favor, compruebe su conexión';

  @override
  String get canNotCheckConnectivity => 'No es posible comprobar la conectividad';
}
