import 'package:aurasync/repositories/permission_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_command/flutter_command.dart';

final class RootViewModel extends ChangeNotifier {
  RootViewModel(this._permissionRepository) {
    requestPermission = Command.createAsyncNoParamNoResult(_requestPermission);
  }

  final PermissionRepository _permissionRepository;

  late final Command<void, void> requestPermission;

  Future<void> _requestPermission() async {
    await _permissionRepository.storage();
  }

  @override
  void dispose() {
    requestPermission.dispose();
    super.dispose();
  }
}
