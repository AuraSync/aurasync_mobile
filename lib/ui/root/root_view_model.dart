import 'package:aurasync/repositories/permission_repository.dart';
import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';

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
