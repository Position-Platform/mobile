import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:position/src/core/utils/colors.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: transparent,
    ));
  }
}
