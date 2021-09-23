import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../architecture_core.dart';
import 'app_module.dart';

class AppSettings {
  /// Global app's title
  static late String appTitle;

  /// Global app's API path
  static late String apiPath;

  /// Activate log for all API requests
  static bool enableLog = false;

  /// Callback handler for HTTP errors
  static Function(String) errorHandler = print;

  /// List of active modules
  static List<AppModule> modules = <AppModule>[];

  /// List of request interceptors
  static List<Interceptor> interceptors = <Interceptor>[];

  /// Init AppSettings with all parameters
  static void init({required String appTitle, required String apiPath, bool enableLog = false, Function(String) errorHandler = print}) {
    AppSettings.appTitle = appTitle;
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
}


// import 'package:architecture_core/architecture_core.dart';
// import 'package:architecture_core/global/app_module.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
//
// class AppSettings {
//   /// Global app's title
//   late final String appTitle;
//
//   /// Global app's API path
//   late final String apiPath;
//
//   /// Activate log for all API requests
//   late final bool enableLog;
//
//   /// Error handler for API's HTTP errors
//   late final Function(String) errorHandler;
//
//   /// List of active modules
//   final List<AppModule> _modules = <AppModule>[];
//
//   /// List of request interceptors
//   final List<Interceptor> _interceptors = <Interceptor>[];
//
//   final GetStorage _storage = GetStorage();
//
//   static const String _TITLE_KEY = 'appTitle';
//   static const String _API_PATH = 'apiPath';
//   static const String _ENABLE_LOG = 'enableLog';
//   static const String _ERROR_HANDLER = 'errorHandler';
//
//   AppSettings._(this.appTitle, this.apiPath,
//       {this.enableLog = false, this.errorHandler = print}) :
//       assert(apiPath.endsWith("/"), "apiPath must end with '/'") {
//     _storeSettings();
//   }
//
//   AppSettings._get() {
//     _getSettings();
//   }
//
//   factory AppSettings.init({String? appTitle, String? apiPath}) {
//     if ((appTitle == null || appTitle.isEmpty) &&
//         (apiPath == null || apiPath.isEmpty)) return AppSettings._get();
//     return AppSettings._(appTitle!, apiPath!);
//   }
//
//   void _getSettings() {
//     appTitle = _storage.read(_TITLE_KEY);
//     apiPath = _storage.read(_API_PATH);
//     enableLog = _storage.read(_ENABLE_LOG);
//     errorHandler = _storage.read(_ERROR_HANDLER);
//   }
//
//   void _storeSettings() {
//     _storeTitle();
//     _storeApiPath();
//     _storeEnableLog();
//     _storeErrorHandler();
//   }
//
//   void _storeTitle() => _validateAndStore<String>(_TITLE_KEY, appTitle);
//   void _storeApiPath() => _validateAndStore<String>(_API_PATH, apiPath);
//   void _storeEnableLog() => _validateAndStore<bool>(_ENABLE_LOG, enableLog);
//   void _storeErrorHandler() => _validateAndStore<Function(String)>(_ERROR_HANDLER, errorHandler);
//
//   void _validateAndStore<T>(String key, T value) {
//     if (_storage.hasData(key)) {
//       final _storedValue = _storage.read(key);
//       if (_storedValue != value) _store<T>(key, value);
//     } else {
//       _store<T>(key, value);
//     }
//   }
//
//   void _store<T>(String key, T value) => _storage.write(key, value);
//
//   void register(AppModule module) {
//     CoreRouter.register(module);
//     this._modules.add(module);
//   }
//
//   void registerAll(List<AppModule> modules) {
//     for (AppModule module in modules) {
//       register(module);
//     }
//   }
//
//   List<Interceptor> get interceptors => this._interceptors;
//   set interceptor(List<Interceptor> i) => this._interceptors.addAll(i);
//   void clearInterceptors() => this._interceptors.clear();
// }
