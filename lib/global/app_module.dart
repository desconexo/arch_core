import 'package:architecture_core/architecture_core.dart';

abstract class AppModule {
  final String name;
  final RouterObject router;
  final List<StoragePermissions> storagePermissions;
  bool initialModule = false;

  AppModule(this.name, this.router, {this.storagePermissions = const <StoragePermissions>[]});

  AppModule get initial {
    this.initialModule = true;
    return this;
  }
}
