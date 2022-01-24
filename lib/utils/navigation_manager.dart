import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koa_health/screens/main_screen.dart';

class NavigationManager {
  final BuildContext context;

  NavigationManager(this.context);

  void openScreen(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void goToHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void back() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}
