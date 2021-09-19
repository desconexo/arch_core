import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class RouterObject {
  final String path;
  final Widget page;
  final Bindings? binding;
  final bool requireAuthorization;
  final List<RouterObject> children;

  RouterObject(
      this.path,
      this.page,{
    this.binding,
    this.requireAuthorization = false,
    this.children = const <RouterObject>[],
  });


}
