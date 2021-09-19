import 'package:architecture_core/global/app_module.dart';
import 'package:architecture_core/router/router_object.dart';
import 'package:get/get.dart';

class CoreRouter {
  static final List<GetPage> routes = <GetPage>[];

  static void register(AppModule module) {
    routes.add(_buildGetPage(module.router, module.name));
  }

  static GetPage _buildGetPage(RouterObject routerObject, String module) {
    return GetPage(
      name: routerObject.path,
      page: () => routerObject.page,
      title: module,
      binding: routerObject.binding,
      middlewares: routerObject.requireAuthorization ? [] : [],
      children: routerObject.children
          .map<GetPage>((r) => _buildGetPage(r, module))
          .toList(),
    );
  }
}
