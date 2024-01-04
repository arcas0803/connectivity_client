import 'connectivity_localizations.dart';

/// The translations for Portuguese (`pt`).
class ConnectivityLocalizationsPt extends ConnectivityLocalizations {
  ConnectivityLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get noInternetConnection => 'Sem conexão com a internet. Por favor, verifique sua conexão e tente novamente';

  @override
  String get canNotCheckConnectivity => 'Não é possível verificar a conectividade';
}
