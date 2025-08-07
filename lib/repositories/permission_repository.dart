import 'package:aurasync/services/permission_service.dart';

abstract class PermissionRepository {
  Future<void> nearby();
  Future<void> storage();
  void dispose();
}

final class PermissionRepositoryImpl implements PermissionRepository {
  const PermissionRepositoryImpl(this._permissionService);

  final PermissionService _permissionService;

  @override
  Future<void> nearby() async {
    final isGranted = await _permissionService.nearby();
    if (!isGranted) await nearby();
    return;
  }

  @override
  Future<void> storage() async {
    final isGranted = await _permissionService.nearby();
    if (!isGranted) await nearby();
    return;
  }

  @override
  void dispose() {}
}
