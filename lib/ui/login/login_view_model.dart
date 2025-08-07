part of 'login_screen.dart';

final class _LoginViewModel extends ChangeNotifier {
  _LoginViewModel(this._authRepository, this._permissionRepository) {
    discover = Command.createAsyncNoParamNoResult(_discover);
    advertise = Command.createAsyncNoParamNoResult(_advertise);
    requestPermission = Command.createAsyncNoParamNoResult(_requestPermission);
  }

  final AuthRepository _authRepository;
  final PermissionRepository _permissionRepository;

  final _devices = <DeviceEntity>{};
  Set<DeviceEntity> get devices => _devices;

  StreamSubscription<DeviceEntity>? _devicesSubscription;

  late final Command<void, void> discover;
  late final Command<void, void> advertise;
  late final Command<void, void> requestPermission;

  Future<void> _discover() async {
    final devices = await _authRepository.discover(DeviceTypeEnum.pc);
    _devicesSubscription = devices.listen((device) {
      _devices.add(device);
      notifyListeners();
    });
  }

  Future<void> _advertise() async {
    await _authRepository.advertise(DeviceTypeEnum.mobile);
  }

  Future<void> _requestPermission() async {
    await _permissionRepository.nearby();
  }

  @override
  void dispose() {
    discover.dispose();
    advertise.dispose();
    requestPermission.dispose();
    _authRepository.dispose();
    _devicesSubscription?.cancel();
    _permissionRepository.dispose();
    super.dispose();
  }
}
