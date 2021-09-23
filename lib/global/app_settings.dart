import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../architecture_core.dart';
import 'app_module.dart';

class AppSettings {
  /// Global app's name
  static String appName = "";

  /// Global app's API path
  static String apiPath = "";

  /// Activate log for all API requests
  static bool enableLog = false;

  /// Callback handler for HTTP errors
  static Function(String) errorHandler = print;

  /// List of active modules
  static List<AppModule> modules = <AppModule>[];

  /// List of request interceptors
  static List<Interceptor> interceptors = <Interceptor>[];

  /// Init AppSettings with all parameters
  static void init({String appTitle = "", required String apiPath, bool enableLog = false, Function(String) errorHandler = print}) {
    AppSettings.appName = appTitle;
    AppSettings.apiPath = apiPath;
    AppSettings.enableLog = enableLog;
    AppSettings.errorHandler = errorHandler;
  }

  /// Register a new module
  static void register(AppModule module) {
    if(modules.any((m) => m.name == module.name))
      throw Exception("You must not register a module more then once");
    if(module.initialModule)
      if(modules.any((m) => m.initialModule))
        throw Exception("Only one initial module is supported");

    CoreRouter.register(module);
    modules.add(module);
  }

  /// Register all modules at once
  static void registerAll(List<AppModule> modules) {
    for (AppModule module in modules) {
      register(module);
    }
  }

  static String get initialRoute {
    if(!modules.any((module) => module.initialModule))
      throw Exception("No initial module found");
    return modules.firstWhere((module) => module.initialModule).router.path;
  }

  static List<GetPage> get routes => CoreRouter.routes;

  static AppModule get getCurrentModule {
    final String fullRoute = Get.currentRoute;
    String currentRoute;

    if(fullRoute.startsWith('/')) {
      currentRoute = fullRoute.split("/")[1];
    } else {
      currentRoute = fullRoute.split("/").first;
    }

    try {
      return modules.firstWhere((r) {
        print(r.router.path);
        print(currentRoute);
        return r.router.path == '/$currentRoute';
      });
    } catch (e) {
      throw Exception("module not found");
    }
  }
}
