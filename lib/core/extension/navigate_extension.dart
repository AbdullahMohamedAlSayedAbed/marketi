import 'package:flutter/material.dart';
import 'package:marketi/core/utils/on_generate_router.dart';

extension NavigationExtension on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop<T extends Object?>([T? result]) {
    if (Navigator.canPop(this)) {
      Navigator.pop(this, result);
    } else {
      Navigator.pushNamedAndRemoveUntil(this, AppRouter.home, (route) => false);
    }
  }
}
