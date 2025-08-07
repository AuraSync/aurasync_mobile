import 'package:permission_handler/permission_handler.dart';

final class PermissionService {
  Future<bool> nearby() async {
    final status = await Permission.nearbyWifiDevices.request();
    return status == PermissionStatus.granted;
  }

  Future<bool> storage() async {
    final statuses = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    return statuses[Permission.storage] == PermissionStatus.granted ||
        statuses[Permission.manageExternalStorage] == PermissionStatus.granted;
  }
}
