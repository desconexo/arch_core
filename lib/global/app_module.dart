import 'package:architecture_core/architecture_core.dart';

abstract class AppModule {
  final String name;
  final RouterObject router;
  bool initialModule = false;

  AppModule(this.name, this.router);

  AppModule get initial {
    this.initialModule = true;
    return this;
  }
}
