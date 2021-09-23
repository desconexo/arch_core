import 'package:architecture_core/architecture_core.dart';
import 'package:get_storage/get_storage.dart';

class StorageManager {
  static final GetStorage _storage = GetStorage(AppSettings.appName);
  GetStorage get get => _storage;

  T? read<T>(String key) {
    if (AppSettings.getCurrentModule.storagePermissions.contains(StoragePermissions.READ))
      return _storage.read<T>(key);
    throw Exception("You don't have the read permission");
  }

  Future<void> write(String key, dynamic value) {
    if (AppSettings.getCurrentModule.storagePermissions.contains(StoragePermissions.WRITE))
      return _storage.write(key, value);
    throw Exception("You don't have the write permission");
  }

  Future<void> delete(String key) {
    if (AppSettings.getCurrentModule.storagePermissions.contains(StoragePermissions.DELETE))
      return _storage.remove(key);
    throw Exception("You don't have the delete permission");
  }

  Future<void> erase() {
    if (AppSettings.getCurrentModule.storagePermissions.contains(StoragePermissions.DELETE))
      return _storage.erase();
    throw Exception("You don't have the delete permission");
  }
}