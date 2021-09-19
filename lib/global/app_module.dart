import 'package:architecture_core/architecture_core.dart';

abstract class AppModule {
  final String name;
  final RouterObject router;
  final bool initialModule;

  AppModule(this.name, this.router, {this.initialModule = false});
}
