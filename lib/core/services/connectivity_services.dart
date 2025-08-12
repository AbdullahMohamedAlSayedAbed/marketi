import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService._();
  static final ConnectivityService _instance = ConnectivityService._();
  factory ConnectivityService() => _instance;

  final Connectivity _connectivity = Connectivity();

  Future<bool> checkInternetConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
